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
     return @specificHiddenTreasures.empty? && @specificVisibleTreasures.empty?
  end

  def adjustToFitTreasureList(v, h)
    visibleKind = []
    hiddenKind = []
    visibleToLose = []
    hiddenToLose = []

    v.each{ |treasure|
      visibleKind << treasure.getType
    }
    h.each{ |treasure|
      hiddenKind << treasure.getType
    }

    #Ajusta los tesoros especificos.
    @specificVisibleTreasures.each{ |kind|
      if visibleToLose.count(kind) < visibleKind.count(kind)
        visibleToLose << kind
      end
    }
    @specificHiddenTreasures.each{ |kind|
      if hiddenToLose.count(kind) < hiddenKind.count(kind)
        hiddenToLose << kind
      end
    }
    return SpecificBadConsequence.new(@text, @levels, visibleToLose, hiddenToLose)
  end

end

end
