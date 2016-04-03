#encoding: utf-8

require 'singleton'

class Dice
    #Clase singleton
    include singleton

    #Metodos publicos
    public
    def nextNumber()
      return Random.rand(1..6)
    end
end
