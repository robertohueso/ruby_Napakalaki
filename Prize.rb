#encoding: utf-8

module NapakalakiGame

class Prize

   #Inicializador
   def initialize(treasures, level)
      @treasures = treasures
      @level = level
   end

   #Metodos publicos
   public
   def getLevels()
      return @level
   end

   def getTreasures()
      return @treasures
   end

   #Conversor a texto
   def to_s
      return "Ganas #{@treasures.to_s} tesoros y #{@level.to_s} nieveles"
   end

end

end
