class Prize

   #Inicializador
   def initialize(treasures, level)
      @treasures = treasures
      @level = level
   end

   #Geters basicos
   def getTreasures
      return @treasures
   end

   def getLevel
      return @level
   end

   #Conversor a texto
   def to_s
      return "Treasures = #{@treasures}, Levels = #{@level}"
   end

end
