#encoding: utf-8

require_relative "BadConsequence"

module NapakalakiGame

class SpecificBadConsequence < BadConsequence

  def initialize(text, levels, tVisible, tHidden)
    super(text, levels)
    @specificVisibleTreasures = tVisible
    @specificHiddenTreasures = tHidden
  end

  def getSpecificHiddenTreasures
     return @specificHiddenTreasures
  end

  def getSpecificVisibleTreasures
     return @specificVisibleTreasures
  end

end

end
