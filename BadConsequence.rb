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

   #Metodos publicos
   public

   def getLevels
      return @levels
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
