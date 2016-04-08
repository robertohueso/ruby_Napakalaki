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
      if @currentPlayerIndex == nil
         @currentPlayerIndex = Random.rand(@players.length)
      else
         new_index = @currentPlayerIndex + 1
         if new_index == @players.length
            new_index = 0
         end
         @currentPlayerIndex = new_index
      end
   end

   def nextTurnAllowed()
      if @currentPlayer == nil
         self.initPlayers
      end
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
   end

   def getCurrentPlayer()
      return @currentPlayer
   end

   def getCurrentMonster()
      return @currentMonster
   end

   def nextTurn()
   end

   def endOfGame(result)
      return result == CombatResult::WINGAME
   end
end

end
