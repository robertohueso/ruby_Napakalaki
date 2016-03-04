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
      return "Treasures = #{@treasures.to_s}, Levels = #{@level.to_s}"
   end

end
