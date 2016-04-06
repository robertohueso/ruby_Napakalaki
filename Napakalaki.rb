#encoding: utf-8

require "singleton"
require_relative "Monster"
require_relative "Player"
require_relative "CombatResult"
require_relative "CardDealer"

module NapakalakiGame

class Napakalaki
   #Clase singleton
   include Singleton

   def initialize()
      @currentPlayerIndex = nil
      @currentMonster = nil
      @dealer = nil
      @currentPlayer = nil
      @players = []
      #EXAMEN
      @referee = Referee.getInstance
      #FIN EXAMEN
   end

   #Metodos privados
   private
   def initPlayers(names)

   end

   def nextPlayer()
   end

   def nextTurnAllowed()
   end

   #Metodos publicos
   public
   def Napakalaki.getInstance()
      self.instance
   end

   def developCombat()
   end

   def discardVisibleTreasures(treasures)
   end

   def discardHiddenTreasures(treasures)
   end

   def makeTreasuresVisible(treasures)
   end

   def initGame(players)
   end

   def getCurrentPlayer()
   end

   def getCurrentMonster()
   end

   def nextTurn()
   end

   def endOfGame(result)
   end
end

end
