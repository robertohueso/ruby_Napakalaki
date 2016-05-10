#encoding: utf-8

module NapakalakiGame

class Cultist
  def initialize(name, gainedLevels)
    @name = name
    @gainedLevels = gainedLevels
  end

  def getGainedlevels()
    @gainedLevels
  end

  def to_s
    return "#{@name} ---- Gana: #{@gainedLevels} niveles."
  end
end

end
