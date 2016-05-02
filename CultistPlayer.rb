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

  def getCombatLevel()
    mitad_combat_level = (0.5 * super).to_i
    levels_cultist = @myCultistCard.getGainedlevels * @@totalCultistPlayers
    return super + mitad_combat_level + levels_cultist
  end

  def getOponentLevel(m)
    return m.getCombatLevelChangeAgainstCultistPlayer
  end

  def shouldConvert()
    return false
  end

  private

  def giveMeATreasure()
  end

  def canYouGiveMeATreasure()
  end

end
