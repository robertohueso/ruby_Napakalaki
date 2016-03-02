require_relative 'Prize'
require_relative 'BadConsequence'

class Monster

   #Inicializador
   def initialize(name, level, badConsequence, prize)
      @name = name
      @level = level
      @badConsequence = badConsequence
      @prize = prize
   end

   def getName
      return @name
   end

   def getCombatLevel
      return @level
   end

   def to_s
      return "Nombre: #{@name}, Nivel #{@level.to_s}, Buen Rollo #{@prize.to_s}, Mal rollo #{@badConsequence.to_s}"
   end

end
