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
   end

   #Metodos privados
   private
   def initPlayers(names)
      names.each{ |player_name|
         @players << Player.new(player_name)
      }
   end

   def nextPlayer()
      #Actualiza el índice
      if @currentPlayerIndex == nil
         @currentPlayerIndex = Random.rand(@players.length)
      else
         @currentPlayerIndex = (@currentPlayerIndex + 1) % @players.length
      end

      #Actualiza el jugador
      @currentPlayer = players[@currentPlayerIndex];
   end

   def nextTurnAllowed()
     @currentPlayer.validState
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
     self.initPlayers(players)
     @dealer.initCards
     self.nextTurn
   end

   def getCurrentPlayer()
      return @currentPlayer
   end

   def getCurrentMonster()
      return @currentMonster
   end

   def nextTurn()
     #FIXME Debo inicializar stateOK a false?
     stateOK = false

     if @currentPlayer != nil
       stateOK = self.nextTurnAllowed
     end

     if stateOK
        @currentMonster = @dealer.nextMonster
        @currentPlayer = self.nextPlayer
        dead = @currentPlayer.isDead

        if dead
          @currentPlayer.initTreasures
        end
     end

     return stateOK
   end

   def endOfGame(result)
      return result == CombatResult::WINGAME
   end
end

end
