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
      @dealer = CardDealer.instance
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
      @currentPlayer = @players[@currentPlayerIndex];
   end

   def nextTurnAllowed()
     @currentPlayer.validState
   end

   #Metodos publicos
   public
   def Napakalaki.getInstance()
      instance
   end

   def developCombat()
     combatResult = @currentPlayer.combat(@currentMonster)
     @dealer.giveMonsterBack(@currentMonster)
     return combatResult
   end

   def discardVisibleTreasures(treasures)
     treasures.each{ |treasure|
       @currentPlayer.discardVisibleTreasure(treasure)
     }
   end

   def discardHiddenTreasures(treasures)
     treasures.each{ |treasure|
       @currentPlayer.discardHiddenTreasure(treasure)
     }
   end

   def makeTreasuresVisible(treasures)
     treasures.each{ |treasure|
       @currentPlayer.makeTreasureVisible(treasure)
     }
   end

   def initGame(players)
     initPlayers(players)
     @dealer.initCards
     nextTurn
   end

   def getCurrentPlayer()
      return @currentPlayer
   end

   def getCurrentMonster()
      return @currentMonster
   end

   def nextTurn()
     stateOK = true

     if @currentPlayer != nil
       stateOK = nextTurnAllowed
     end

     if stateOK
        @currentMonster = @dealer.nextMonster
        @currentPlayer = nextPlayer
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
