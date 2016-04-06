#encoding: utf-8

require_relative 'Prize'
require_relative 'BadConsequence'

module NapakalakiGame

class Monster

   #Inicializador
   def initialize(name, level, badConsequence, prize)
      @name = name
      @combatLevel = level
      @badConsequence = badConsequence
      @prize = prize
      #EXAMEN
      if defined? @@contador
         @@contador += 1
      else
         @@contador = 0
      end
      #FIN EXAMEN
   end

   #Metodos publicos
   public
   #EXAMEN
   def Monster.getNumberOfMonsters()
      if defined? @@contador
         return @@contador
      else
         return 0
      end
   end
   #FIN EXAMEN
   def getName
      return @name
   end

   def getCombatLevel
      return @combatLevel
   end

   def getBadConsequence
      return @badConsequence
   end

   def getLevelsGained
      return @prize.getLevels
   end

   def getTreasuresGained
      return @prize.getTreasures
   end

   def to_s
      return "Nombre: #{@name} \n\t Nivel: #{@level.to_s} \n\t Buen Rollo: #{@prize.to_s} \n\t Mal rollo: #{@badConsequence.to_s}\n"
   end

end

end
