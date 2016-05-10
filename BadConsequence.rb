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

   #Conversor a texto
   def to_s
      return @text
   end

   private_class_method :new
end

end
