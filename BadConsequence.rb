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
      self.new(aText, someLevels, someVisibleTreasures, someHiddenTreasures, [], [])
   end

   def self.newLevelSpecificTreasures(aText, someLevels, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
      self.new(aText, someLevels, 0, 0, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
   end

   def self.newDeath(aText)
      self.new(aText, 10, 10, 10, [], [])
   end

   #Getters basicos
   def getText
      return @text
   end

   def getLevels
      return @levels
   end

   def getNVisible
      return @nVisibleTreasures
   end

   def getNHidden
      return @nHiddenTreasures
   end

   #Conversor a texto
   def to_s
      return @text
   end

   private_class_method :new
end
