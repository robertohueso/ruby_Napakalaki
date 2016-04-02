#encoding: utf-8

require_relative "Treasure"
require_relative "Dice"
require_relative "BadConsequence"
require_relative "CardDealer"
require_relative "CombatResult"

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
   end

   def getCombatLevel()
   end

   def incrementLevels(l)
   end

   def decrementLevels(l)
   end

   def setPendingBadConsequence(b)
   end

   def applyPrize(m)
   end

   def applyBadConsequence(m)
   end

   def canMakeTreasureVisible(t)
   end

   def howManyVisibleTreasures(tKind)
   end

   def dieIfNoTreasures()
   end

   #Metodos publicos
   public
   def getName()
   end

   def isDead()
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
   end

   def discardHiddenTreasure(t)
   end

   def validState()
   end

   def initTreasures()
   end

   def getLevels()
   end

   def discardAllTreasures()
   end
end
