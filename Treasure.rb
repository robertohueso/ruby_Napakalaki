#encoding: utf-8

require_relative "TreasureKind"

class Treasure
   #Constructor
   def initialize(n, bonus, t)
      @name = n
      @bonus = bonus
      @type = t
   end

   #Metodos publicos
   public
   def getName()
   end

   def getBonus()
   end

   def getType()
   end
end
