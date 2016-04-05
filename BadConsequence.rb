#encoding: utf-8

require_relative "TreasureKind"
require_relative "Player"

module NapakalakiGame

class BadConsequence
   MAXTREASURES = 10

   #Inicializadores
   def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
      @text = aText
      @levels = someLevels
      @nVisibleTreasures = someVisibleTreasures
      @nHiddenTreasures = someHiddenTreasures
      @specificVisibleTreasures = someSpecificVisibleTreasures
      @specificHiddenTreasures = someSpecificHiddenTreasures
   end

   def self.newLevelNumberOfTreasures(aText, someLevels, someVisibleTreasures, someHiddenTreasures)
      new(aText, someLevels, someVisibleTreasures, someHiddenTreasures, [], [])
   end

   def self.newLevelSpecificTreasures(aText, someLevels, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
      new(aText, someLevels, 0, 0, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
   end

   def self.newDeath(aText)
      new(aText, Player::MAXLEVEL, MAXTREASURES, MAXTREASURES, [], [])
   end

   #Metodos publicos
   public
   def isEmpty
      return @nVisibleTreasures == 0 && @nHiddenTreasures == 0 &&
             @specificHiddenTreasures.empty? && @someSpecificVisibleTreasures.empty?
   end

   def getLevels
      return @levels
   end

   def getNVisibleTreasures
      return @nVisibleTreasures
   end

   def getNHiddenTreasures
      return @nHiddenTreasures
   end

   def getSpecificHiddenTreasures
      return @specificHiddenTreasures
   end

   def getSpecificVisibleTreasures
      return @specificVisibleTreasures
   end

   def substractVisibleTreasure(t)
   end

   def substractHiddenTreasure(t)
   end

   def adjustToFitTreasureList(v, h)
   end

   #Conversor a texto
   def to_s
      return @text
   end

   private_class_method :new
end

end
