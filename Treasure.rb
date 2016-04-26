#encoding: utf-8

require_relative "TreasureKind"

module NapakalakiGame

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
      return @name
   end

   def getBonus()
      return @bonus
   end

   def getType()
      return @type
   end

   def to_s()
     return "#{@name}, #{@type}, #{@bonus}"
   end
end

end
