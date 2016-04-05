#encoding: utf-8

require "singleton"

module NapakalakiGame

class Dice
   #Clase singleton
   include Singleton

   #Metodos publicos
   public
   def Dice.getInstance()
      self.instance
   end

   def nextNumber()
      return Random.rand(1..6)
   end
end

end
