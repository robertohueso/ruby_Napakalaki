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

  def adjustToFitTreasureList(v, h)
    visibleKind = []
    hiddenKind = []
    nVisible = @nVisibleTreasures
    nHidden = @nHiddenTreasures

    v.each{ |treasure|
      visibleKind << treasure.getType
    }
    h.each{ |treasure|
      hiddenKind << treasure.getType
    }

    #Ajusta la cantidad de tesoros perdidos.
    if nVisible > visibleKind.size
      nVisible = visibleKind.size
    end

    if nHidden > hiddenKind.size
      nHidden = hiddenKind.size
    end

    return new(@text, @levels, nVisible, nHidden)
  end

end

end
