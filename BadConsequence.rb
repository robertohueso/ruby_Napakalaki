#encoding: utf-8

require_relative "TreasureKind"
require_relative "Player"

module NapakalakiGame

class BadConsequence
   MAXTREASURES = 10

   #Inicializadores
   def initialize(aText, someLevels)
      @text = aText
      @levels = someLevels
   end

   def self.newLevelNumberOfTreasures(aText, someLevels, someVisibleTreasures, someHiddenTreasures)
      new(aText, someLevels, someVisibleTreasures, someHiddenTreasures, [], [])
   end

   def self.newLevelSpecificTreasures(aText, someLevels, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
      new(aText, someLevels, 0, 0, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
   end

   def self.newDeath(aText)
      new(aText, Player::MAXLEVEL, MAXTREASURES, MAXTREASURES, [], [])
   end

   #Metodos publicos
   public
   def isEmpty
      return @nVisibleTreasures == 0 && @nHiddenTreasures == 0 &&
             @specificHiddenTreasures.empty? && @specificVisibleTreasures.empty?
   end

   def getLevels
      return @levels
   end

   def getNVisibleTreasures
      return @nVisibleTreasures
   end

   def getNHiddenTreasures
      return @nHiddenTreasures
   end

   def getSpecificHiddenTreasures
      return @specificHiddenTreasures
   end

   def getSpecificVisibleTreasures
      return @specificVisibleTreasures
   end

   def substractVisibleTreasure(t)
     if @specificVisibleTreasures.delete_at(@specificVisibleTreasures.index(t.getType) ||
                                        @specificVisibleTreasures.length) == nil
       @nVisibleTreasures -= 1
     end
   end

   def substractHiddenTreasure(t)
     if @specificHiddenTreasures.delete(t.getType) == nil
       @nHiddenTreasures -= 1
     end
   end

   def adjustToFitTreasureList(v, h)
     visibleKind = []
     hiddenKind = []
     visibleToLose = []
     hiddenToLose = []
     nVisible = @nVisibleTreasures
     nHidden = @nHiddenTreasures

     v.each{ |treasure|
       visibleKind << treasure.getType
     }
     h.each{ |treasure|
       hiddenKind << treasure.getType
     }

     if(@specificVisibleTreasures.empty? && @specificHiddenTreasures.empty?)
       #Ajusta la cantidad de tesoros perdidos.
       if nVisible > visibleKind.size
         nVisible = visibleKind.size
       end
       if nHidden > hiddenKind.size
         nHidden = hiddenKind.size
       end
       return BadConsequence.newLevelNumberOfTreasures(@text, @levels, nVisible, nHidden)
     else
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
       return BadConsequence.newLevelSpecificTreasures(@text, @levels, visibleToLose, hiddenToLose)
     end
   end

   #Conversor a texto
   def to_s
      return @text
   end

   private_class_method :new
end

end
