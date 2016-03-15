#encoding: utf-8

require_relative 'TreasureKind'

class BadConsequence

   #Inicializadores
   def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
      @text = aText
      @levels = someLevels
      @nVisibleTreasures = someVisibleTreasures
      @nHiddenTreasures = someHiddenTreasures
      @visibleTreasures = someSpecificVisibleTreasures
      @hiddenTreasures = someSpecificHiddenTreasures
   end

   def self.newLevelNumberOfTreasures(aText, someLevels, someVisibleTreasures, someHiddenTreasures)
      new(aText, someLevels, someVisibleTreasures, someHiddenTreasures, [], [])
   end

   def self.newLevelSpecificTreasures(aText, someLevels, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
      new(aText, someLevels, 0, 0, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
   end

   def self.newDeath(aText)
      new(aText, 10, 10, 10, [], [])
   end

   #Getters basicos
   attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures,
      :visibleTreasures, :hiddenTreasures

   #Conversor a texto
   def to_s
      return @text
   end

   private_class_method :new
end
