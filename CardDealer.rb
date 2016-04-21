#encoding: utf-8

require_relative "Treasure"
require_relative "Monster"
require "singleton"

module NapakalakiGame

class CardDealer
   #Clase singleton
   include Singleton

   def initialize()
      @unusedMonsters = []
      @usedMonsters = []
      @unusedTreasures = []
      @usedTreasures = []
   end

   #Metodos privados
   private
   def initTreasureCardDeck()
      @unusedTreasures << Treasure.new("¡Sí mi amo!",4,TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Botas de investigación",3,TreasureKind::SHOES)
      @unusedTreasures << Treasure.new("Capucha de Cthulhu",3,TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("A prueba de babas",2,TreasureKind::ARMOR)
      @unusedTreasures << Treasure.new("Botas de lluvia ácida",1, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Casco minero", 2, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Ametralladora Thompson", 4, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Camiseta de la UGR", 1, TreasureKind::ARMOR)
      @unusedTreasures << Treasure.new("Clavo de rail ferroviario",3, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Cuchillo de sushi arcano", 2, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Fez alópodo", 3, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Hacha prehistórica", 2, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("El aparato del Pr. Tesla", 4, TreasureKind::ARMOR)
      @unusedTreasures << Treasure.new("Gaita", 4, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Insecticida", 2, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Escopeta de 3 cañones", 4, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Garabato místico", 2, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("La rebeca metálica", 2, TreasureKind::ARMOR)
      @unusedTreasures << Treasure.new("Lanzallamas", 4, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Necro-comicón", 1, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Necronomicón", 5, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Linterna a 2 manos", 3, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Necro-gnomicón", 2, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Necrotelecom", 2, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Mazo de los antiguos", 3, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Necro-playboycón", 3, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Porra preternatural", 2, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Shogulador", 1, TreasureKind::BOTHHANDS)
      @unusedTreasures << Treasure.new("Varita de atizamiento", 3, TreasureKind::ONEHAND)
      @unusedTreasures << Treasure.new("Tentáculo de pega", 2, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Zapato deja-amigos", 1, TreasureKind::SHOES)
   end

   def initMonsterCardDeck()
      textos_bc = {
         "Byakhees" => "Pierdes tu armadura visible y otra oculta",
         "Chibithulhu" => "Embobados del con el lindo primigeneo te descartas de tu casco visible",
         "sopor" => "El primordial bostezo contagioso. Pierdes el calzado visible",
         "angeles" => "Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta",
         "gorron" => "Pierdes todos tus tesoros visibles",
         "hp" => "Pierdes la armadura visible",
         "Bichgooth" => "Sientes bichos bajo la ropa. Descarta la armadura visible",
         "rey" => "Pierdes 5 niveles y 3 tesoros visibles",
         "redacta" => "Toses los pulmones y pierdes 2 niveles",
         "hondos" => "Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estas muerto",
         "semillas" => "Pierdes 2 niveles y 2 tesoros ocultos",
         "dameargo" => "Te intentas escaquear. Pierdes 1 mano visible",
         "pollipolipo" => "Da mucho asquito. Pierdes 3 niveles",
         "Yskhtihyssg" => "No le hace gracia que pronuncien mal su nombre. Estas muerto",
         "familia" => "La familia te atrapa. Estas muerto",
         "Roboggoth" => "La quinta directiva primaria te obliga a perder 2 niveles y 2 tesoros de una mano visibles",
         "espia" => "Te asusta en la noche. Pierdes 1 casco visible",
         "lenguas" => "Menudo susto te llevas. Pierdes 3 niveles y 5 tesoros visibles",
         "bicefalo" => "Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos"
      }

      bc = BadConsequence.newLevelSpecificTreasures(textos_bc["Byakhees"],
            0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
      prize = Prize.new(2, 1)
      @unusedMonsters << Monster.new("Byakhees de bonanza", 8, bc, prize)

      bc = BadConsequence.newLevelSpecificTreasures(textos_bc["Chibithulhu"],
            0, [TreasureKind::HELMET], [])
      prize = Prize.new(1, 1)
      @unusedMonsters << Monster.new("Chibithulhu", 2, bc, prize)

      bc = BadConsequence.newLevelSpecificTreasures(textos_bc["sopor"],
            0, [TreasureKind::SHOES], [])
      prize = Prize.new(1, 1)
      @unusedMonsters << Monster.new("El sopor de Dunwich", 2, bc, prize)

      bc = BadConsequence.newLevelSpecificTreasures(textos_bc["angeles"],
            0, [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
      prize = Prize.new(4, 1)
      @unusedMonsters << Monster.new("Angeles de la noche ibicenca", 14, bc, prize)

      bc = BadConsequence.newLevelNumberOfTreasures(textos_bc["gorron"], 0, BadConsequence::MAXTREASURES, 0)
      prize = Prize.new(3, 1)
      @unusedMonsters << Monster.new("El gorron en el umbral", 10, bc, prize)

      bc = BadConsequence.newLevelSpecificTreasures(textos_bc["hp"],
            0, [TreasureKind::ARMOR], [])
      prize = Prize.new(2, 1)
      @unusedMonsters << Monster.new("H.P Munchcraft", 6, bc, prize)

      bc = BadConsequence.newLevelSpecificTreasures(textos_bc["Bichgooth"],
            0, [TreasureKind::ARMOR], [])
      prize = Prize.new(1, 1)
      @unusedMonsters << Monster.new("Bichgooth", 2, bc, prize)

      bc = BadConsequence.newLevelNumberOfTreasures(textos_bc["rey"], 5, 3, 0)
      prize = Prize.new(4, 2)
      @unusedMonsters << Monster.new("El rey rosa", 13, bc, prize)

      bc = BadConsequence.newLevelNumberOfTreasures(textos_bc["redacta"], 2, 0, 0)
      prize = Prize.new(1, 1)
      @unusedMonsters << Monster.new("La que redacta en las tinieblas", 2, bc, prize)

      bc = BadConsequence.newDeath(textos_bc["hondos"])
      prize = Prize.new(2, 1)
      @unusedMonsters << Monster.new("Los hondos", 8, bc, prize)

      bc = BadConsequence.newLevelNumberOfTreasures(textos_bc["semillas"], 2, 0, 2)
      prize = Prize.new(2, 1)
      @unusedMonsters << Monster.new("Semillas de Cthulhu", 4, bc, prize)

      bc = BadConsequence.newLevelSpecificTreasures(textos_bc["dameargo"],
            0, [TreasureKind::ONEHAND], [])
      prize = Prize.new(2, 1)
      @unusedMonsters << Monster.new("Dameargo", 1, bc, prize)

      bc = BadConsequence.newLevelNumberOfTreasures(textos_bc["pollipolipo"], 3, 0, 0)
      prize = Prize.new(1, 1)
      @unusedMonsters << Monster.new("Pollipolipo volante", 3, bc, prize)

      bc = BadConsequence.newDeath(textos_bc["Yskhtihyssg"])
      prize = Prize.new(3, 1)
      @unusedMonsters << Monster.new("Yskhtihyssg-Goth", 12, bc, prize)

      bc = BadConsequence.newDeath(textos_bc["familia"])
      prize = Prize.new(4, 1)
      @unusedMonsters << Monster.new("Familia Feliz", 1, bc, prize)

      bc = BadConsequence.newLevelSpecificTreasures(textos_bc["Roboggoth"],
            2, [TreasureKind::ONEHAND, TreasureKind::ONEHAND], [])
      prize = Prize.new(2, 1)
      @unusedMonsters << Monster.new("Roboggoth", 8, bc, prize)

      bc = BadConsequence.newLevelSpecificTreasures(textos_bc["espia"],
            0, [TreasureKind::HELMET], [])
      prize = Prize.new(1, 1)
      @unusedMonsters << Monster.new("El Espia", 5, bc, prize)

      bc = BadConsequence.newLevelNumberOfTreasures(textos_bc["lenguas"], 3, 5, 0)
      prize = Prize.new(1, 1)
      @unusedMonsters << Monster.new("El lenguas", 20, bc, prize)

      bc = BadConsequence.newLevelSpecificTreasures(textos_bc["bicefalo"],
            0, [TreasureKind::BOTHHANDS, TreasureKind::ONEHAND, TreasureKind::ONEHAND], [])
      prize = Prize.new(1, 1)
      @unusedMonsters << Monster.new("Bicefalo", 20, bc, prize)
   end

   def shuffleTreasures()
      @unusedTreasures.shuffle!
   end

   def shuffleMonsters()
      @unusedMonsters.shuffle!
   end

   #Metodos publicos
   public
   def CardDealer.getInstance()
      instance
   end

   def nextTreasure()
     if(@unusedTreasures.empty?)
       @unusedTreasures = @usedTreasures
       @usedTreasures.clear
       shuffleTreasures
     end

     @unusedTreasures.pop
   end

   def nextMonster()
     if(@unusedMonsters.empty?)
       @unusedMonsters = @usedMonsters
       @usedMonsters.clear
       shuffleMonsters
     end

     @unusedMonsters.pop
   end

   def giveTreasureBack(t)
      @usedTreasures << t
   end

   def giveMonsterBack(m)
      @usedMonsters << m
   end

   def initCards()
     initTreasureCardDeck
     initMonsterCardDeck
   end
end

end
