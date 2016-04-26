#encoding: utf-8

require_relative "Treasure"
require_relative "Dice"
require_relative "BadConsequence"
require_relative "CardDealer"
require_relative "CombatResult"

module NapakalakiGame

class Player
   MAXLEVEL = 10
   #Constructor
   def initialize(name)
      @name = name
      @level = 1
      @dead = true
      @hiddenTreasures = []
      @visibleTreasures = []
      @pendingBadConsequence = nil
   end

   #Metodos privados
   private
   def bringToLife()
      @dead = false
   end

   def getCombatLevel()
      total_level = @level
      @visibleTreasures.each{ |treasure| total_level += treasure.getBonus()}
      return total_level
   end

   def incrementLevels(l)
      @level += l
   end

   def decrementLevels(l)
      new_level = @level - l
      if new_level >= 1
         @level = new_level
      else
         @level = 1
         @dead = true
      end
   end

   def setPendingBadConsequence(b)
      @pendingBadConsequence = b
   end

   def applyPrize(m)
     nLevels = m.getLevelsGained
     incrementLevels(nLevels)
     nTreasures = m.getTreasuresGained

     if nTreasures > 0
       dealer = CardDealer.instance
       (1..nTreasures).each{
         treasure = dealer.nextTreasure
         @hiddenTreasures << treasure
       }
     end
   end

   def applyBadConsequence(m)
     badConsequence = m.getBadConsequence
     nLevels = badConsequence.getLevels
     decrementLevels(nLevels);
     pendingBad = badConsequence.adjustToFitTreasureList(@visibleTreasures,
                  @hiddenTreasures)
     setPendingBadConsequence(pendingBad)
   end

   def canMakeTreasureVisible(t)
     #Crea una lista de kinds
     t_kinds = []
     @visibleTreasures.each{ |treasure|
       t_kinds << treasure.getType
     }
     kind = t.getType

     #Comprueba si se puede hacer visible
     if(kind == TreasureKind::ARMOR || kind == TreasureKind::HELMET ||
       kind == TreasureKind::SHOES)
       return !(t_kinds.include?(kind))
     else
       if(kind == TreasureKind::BOTHHANDS)
         return !(t_kinds.include?(TreasureKind::ONEHAND)) &&
                !(t_kinds.include?(TreasureKind::BOTHHANDS))
       else
         return t_kinds.count(kind) <= 1
       end
     end
   end

   def howManyVisibleTreasures(tKind)
      total = 0
      @visibleTreasures.each{ |treasure|
         if treasure.getType == tKind
            total += 1
         end
      }
      return total
   end

   def dieIfNoTreasures()
      if @visibleTreasures.empty? && @hiddenTreasures.empty?
         @dead = true
      end
   end

   #Metodos publicos
   public
   def getName()
      return @name
   end

   def isDead()
      return @dead
   end

   def getHiddenTreasures()
     return @hiddenTreasures
   end

   def getVisibleTreasures()
     return @visibleTreasures
   end

   def combat(m)
     myLevel = getCombatLevel
     monsterLevel = m.getCombatLevel

     if myLevel > monsterLevel
       applyPrize(m)
       if @level >= Player::MAXLEVEL
         combatResult = CombatResult::WINGAME
       else
         combatResult = CombatResult::WIN
       end
     else
       applyBadConsequence(m)
       combatResult = CombatResult::LOSE
     end
     return combatResult
   end

   def makeTreasureVisible(t)
     canI = canMakeTreasureVisible(t)
     if canI
       @visibleTreasures << t
       @hiddenTreasures.delete(t)
     end
   end

   def discardVisibleTreasure(t)
     dealer = CardDealer.instance

     @visibleTreasures.delete_at(@visibleTreasures.index(t))
     dealer.giveTreasureBack(t)
     if @pendingBadConsequence != nil && !(@pendingBadConsequence.isEmpty)
       @pendingBadConsequence.substractVisibleTreasure(t)
     end
     dieIfNoTreasures
   end

   def discardHiddenTreasure(t)
     dealer = CardDealer.instance

     @hiddenTreasures.delete_at(@hiddenTreasures.index(t))
     dealer.giveTreasureBack(t)
     if @pendingBadConsequence != nil && !(@pendingBadConsequence.isEmpty)
       @pendingBadConsequence.substractHiddenTreasure(t)
     end
     dieIfNoTreasures
   end

   def validState()
      return (@pendingBadConsequence == nil || @pendingBadConsequence.isEmpty) &&
              @hiddenTreasures.size <= 4
   end

   def initTreasures()
     dealer = CardDealer.instance
     dice = Dice.instance
     bringToLife
     treasure = dealer.nextTreasure
     @hiddenTreasures << treasure
     number = dice.nextNumber

     if number > 1
       treasure = dealer.nextTreasure
       @hiddenTreasures << treasure
     end
     if number == 6
       treasure = dealer.nextTreasure
       @hiddenTreasures << treasure
     end
   end

   def getLevels()
      return @level
   end

   def discardAllTreasures()
     visible = Array.new(@visibleTreasures)
     hidden = Array.new(@hiddenTreasures)
     for treasure in visible
       discardVisibleTreasure(treasure)
     end
     for treasure in hidden
       discardHiddenTreasure(treasure)
     end
   end

   def to_s
     "#{@name} \n\t Nivel: #{@level} \n\t CombatNivel: #{getCombatLevel}"
   end
end

end
