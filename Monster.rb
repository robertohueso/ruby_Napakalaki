#encoding: utf-8

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

   #Getters basicos
   attr_reader :name, :level, :badConsequence, :prize

   def to_s
      return "Nombre: #{@name} \n\t Nivel: #{@level.to_s} \n\t Buen Rollo: #{@prize.to_s} \n\t Mal rollo: #{@badConsequence.to_s}\n"
   end

end
