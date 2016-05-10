#encoding: utf-8

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
end

end
