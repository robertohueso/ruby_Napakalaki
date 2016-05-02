#encoding: utf-8

require_relative "Cultist"
require_relative "Player"

class CultistPlayer < Player

  @@totalCultistPlayers = 0

  def initialize(p, c)
    newCopy(p)
    @myCultistCard = c
    @@totalCultistPlayers += 1
  end

  def CultistPlayer.getTotalCultistPlayers()
    @@totalCultistPlayers
  end

  protected

  def getCombatLevel
  end

  def getOponentLevel(m)
  end

  def shouldConvert()
  end

  private

  def giveMeATreasure()
  end

  def canYouGiveMeATreasure()
  end

end
