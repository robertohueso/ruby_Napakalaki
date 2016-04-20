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
      end
   end

   def setPendingBadConsequence(b)
      @pendingBadConsequence = b
   end

   def applyPrize(m)
   end

   def applyBadConsequence(m)
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
   end

   def getVisibleTreasures()
   end

   def combat(m)
   end

   def makeTreasureVisible(t)
   end

   def discardVisibleTreasure(t)
     dealer = CardDealer.instance

     @visibleTreasures.delete(t)
     dealer.giveTreasureBack(t)
     if @pendingBadConsequence != nil && !(@pendingBadConsequence.isEmpty)
       pendingBadConsequence.substractVisibleTreasure(t)
     end
     self.dieIfNoTreasures
   end

   def discardHiddenTreasure(t)
     dealer = CardDealer.instance

     @hiddenTreasures.delete(t)
     dealer.giveTreasureBack(t)
     if @pendingBadConsequence != nil && !(@pendingBadConsequence.isEmpty)
       pendingBadConsequence.substractHiddenTreasure(t)
     end
     self.dieIfNoTreasures
   end

   def validState()
      return @pendingBadConsequence.isEmpty && @hiddenTreasures.size <= 4
   end

   def initTreasures()
   end

   def getLevels()
      return @level
   end

   def discardAllTreasures()
   end
end

end
