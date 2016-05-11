#encoding: utf-8
#EXAMEN

require_relative "Monster"

module NapakalakiGame

class GoodMonster < Monster

   #Inicializador
   def initialize(name, level, badConsequence, prize, friend, lc = 0)
      super(name, level, badConsequence, prize, lc)
      @friend = friend
   end

   #Metodos publicos
   public

   def getCombatLevel(aPlayer)
     if aPlayer == @friend
       return 0
     else
       return @combatLevel
     end
   end

   def getCombatLevelAgainstCultistPlayer(aPlayer)
     if aPlayer == @friend
       return 0
     else
       return @levelChangeAgainstCultistPlayer + @combatLevel
     end
   end

end

end
#FIN EXAMEN
