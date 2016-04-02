#encoding: utf-8

require_relative "Treasure"
require_relative "Monster"

require 'singleton'

class CardDealer
   #Clase singleton
   include singleton

   def initialize()
      @unusedMonsters = []
      @usedMonsters = []
      @unusedTreasures = []
      @usedTreasures = []
   end

   #Metodos privados
   private
   def initTreasureCardDeck()
   end

   def initMonsterCardDeck()
   end

   def shuffleTreasures()
   end

   def shuffleMonsters()
   end

   #Metodos publicos
   public
   def nextTreasure()
   end

   def nextMonster()
   end

   def giveTreasureBack(t)
   end

   def giveMonsterBack(m)
   end

   def initCards()
   end
end
