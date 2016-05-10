#encoding: utf-8

require_relative "BadConsequence"

module NapakalakiGame

class NumericBadConsequence < BadConsequence

  def initialize(text, levels, nVisible, nHidden)
    super(text, levels)
    @nVisibleTreasures = nVisible
    @nHiddenTreasures = nHidden
  end

  def getNVisibleTreasures
     return @nVisibleTreasures
  end

  def getNHiddenTreasures
     return @nHiddenTreasures
  end

  def substractVisibleTreasure(t)
    @nVisibleTreasures -= 1
  end

  def substractHiddenTreasure(t)
    @nHiddenTreasures -= 1
  end

  def isEmpty
     return @nVisibleTreasures == 0 && @nHiddenTreasures == 0
  end

end

end
