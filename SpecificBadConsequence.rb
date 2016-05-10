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

  def substractVisibleTreasure(t)
    index = @specificVisibleTreasures.index(t.getType)
    if index
      @specificVisibleTreasures.delete_at(index)
    end
  end

  def substractHiddenTreasure(t)
    index = @specificHiddenTreasures.index(t.getType)
    if index
      @specificHiddenTreasures.delete_at(index)
    end
  end

  def isEmpty
     return @specificHiddenTreasures.isEmpty? && @specificVisibleTreasures.isEmpty?
  end

end

end
