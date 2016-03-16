#encoding: utf-8

class Prize

   #Inicializador
   def initialize(treasures, level)
      @treasures = treasures
      @level = level
   end

   #Geters basicos
   attr_reader :treasures, :level

   #Conversor a texto
   def to_s
      return "Ganas #{@treasures.to_s} tesoros y #{@level.to_s} nieveles"
   end

   #EXAMEN
   def Prize.newSinParametro()
      new(1,1)
   end
   #FIN EXAMEN
end
