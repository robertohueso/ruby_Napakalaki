#encoding: utf-8

require_relative "BadConsequence"

module NapakalakiGame

class NumericBadConsequence < BadConsequence

  def initialize(text, levels, nVisible, nHidden)
    super(text, levels)
    @nVisible = nVisible
    @nHidden = nHidden
  end

  def getNVisibleTreasures
     return @nVisibleTreasures
  end

  def getNHiddenTreasures
     return @nHiddenTreasures
  end
  
end

end
