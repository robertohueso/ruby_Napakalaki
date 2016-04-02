require 'singleton'

 class Napakalaki
    #Clase singleton
    include singleton

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

    end

    def nextPlayer()
    end

    def nextTurnAllowed()
    end

    #Metodos publicos
    public
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
