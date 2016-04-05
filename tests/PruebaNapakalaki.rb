require './BadConsequence'
require './CardDealer'
require './CombatResult'
require './Dice'
require './Monster'
require './Napakalaki'
require './Player'
require './Prize'
require './Treasure'
require './TreasureKind'

module NapakalakiGame
   napakalaki = Napakalaki.getInstance
end

=begin PRUEBA VERSION PRACTICA 1
class PruebaNapakalaki
   def initialize
      @textos_bc = {
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
      @monsters = Array.new

      bc = BadConsequence.newLevelSpecificTreasures(@textos_bc["Byakhees"],
            0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
      prize = Prize.new(2, 1)
      @monsters << Monster.new("Byakhees de bonanza", 8, bc, prize)

      bc = BadConsequence.newLevelSpecificTreasures(@textos_bc["Chibithulhu"],
            0, [TreasureKind::HELMET], [])
      prize = Prize.new(1, 1)
      @monsters << Monster.new("Chibithulhu", 2, bc, prize)

      bc = BadConsequence.newLevelSpecificTreasures(@textos_bc["sopor"],
            0, [TreasureKind::SHOES], [])
      prize = Prize.new(1, 1)
      @monsters << Monster.new("El sopor de Dunwich", 2, bc, prize)

      bc = BadConsequence.newLevelSpecificTreasures(@textos_bc["angeles"],
            0, [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
      prize = Prize.new(4, 1)
      @monsters << Monster.new("Angeles de la noche ibicenca", 14, bc, prize)

      bc = BadConsequence.newLevelNumberOfTreasures(@textos_bc["gorron"], 0, 10, 0)
      prize = Prize.new(3, 1)
      @monsters << Monster.new("El gorron en el umbral", 10, bc, prize)

      bc = BadConsequence.newLevelSpecificTreasures(@textos_bc["hp"],
            0, [TreasureKind::ARMOR], [])
      prize = Prize.new(2, 1)
      @monsters << Monster.new("H.P Munchcraft", 6, bc, prize)

      bc = BadConsequence.newLevelSpecificTreasures(@textos_bc["Bichgooth"],
            0, [TreasureKind::ARMOR], [])
      prize = Prize.new(1, 1)
      @monsters << Monster.new("Bichgooth", 2, bc, prize)

      bc = BadConsequence.newLevelNumberOfTreasures(@textos_bc["rey"], 5, 3, 0)
      prize = Prize.new(4, 2)
      @monsters << Monster.new("El rey rosa", 13, bc, prize)

      bc = BadConsequence.newLevelNumberOfTreasures(@textos_bc["redacta"], 2, 0, 0)
      prize = Prize.new(1, 1)
      @monsters << Monster.new("La que redacta en las tinieblas", 2, bc, prize)

      bc = BadConsequence.newDeath(@textos_bc["hondos"])
      prize = Prize.new(2, 1)
      @monsters << Monster.new("Los hondos", 8, bc, prize)

      bc = BadConsequence.newLevelNumberOfTreasures(@textos_bc["semillas"], 2, 0, 2)
      prize = Prize.new(2, 1)
      @monsters << Monster.new("Semillas de Cthulhu", 4, bc, prize)

      bc = BadConsequence.newLevelSpecificTreasures(@textos_bc["dameargo"],
            0, [TreasureKind::ONEHAND], [])
      prize = Prize.new(2, 1)
      @monsters << Monster.new("Dameargo", 1, bc, prize)

      bc = BadConsequence.newLevelNumberOfTreasures(@textos_bc["pollipolipo"], 3, 0, 0)
      prize = Prize.new(1, 1)
      @monsters << Monster.new("Pollipolipo volante", 3, bc, prize)

      bc = BadConsequence.newDeath(@textos_bc["Yskhtihyssg"])
      prize = Prize.new(3, 1)
      @monsters << Monster.new("Yskhtihyssg-Goth", 12, bc, prize)

      bc = BadConsequence.newDeath(@textos_bc["familia"])
      prize = Prize.new(4, 1)
      @monsters << Monster.new("Familia Feliz", 1, bc, prize)

      bc = BadConsequence.newLevelSpecificTreasures(@textos_bc["Roboggoth"],
            2, [TreasureKind::ONEHAND, TreasureKind::ONEHAND], [])
      prize = Prize.new(2, 1)
      @monsters << Monster.new("Roboggoth", 8, bc, prize)

      bc = BadConsequence.newLevelSpecificTreasures(@textos_bc["espia"],
            0, [TreasureKind::HELMET], [])
      prize = Prize.new(1, 1)
      @monsters << Monster.new("El Espia", 5, bc, prize)

      bc = BadConsequence.newLevelNumberOfTreasures(@textos_bc["lenguas"], 3, 5, 0)
      prize = Prize.new(1, 1)
      @monsters << Monster.new("El lenguas", 20, bc, prize)

      bc = BadConsequence.newLevelSpecificTreasures(@textos_bc["bicefalo"],
            0, [TreasureKind::BOTHHANDS, TreasureKind::ONEHAND, TreasureKind::ONEHAND], [])
      prize = Prize.new(1, 1)
      @monsters << Monster.new("Bicefalo", 20, bc, prize)

   end

   def imprimir
      for monstruo in @monsters
         puts monstruo.to_s
      end
   end

   def greaterCombatLevel(level)
      @monsters.select{ |monster| monster.level > level }
   end

   def levelLoosers
      @monsters.select{|monster|
         monster.badConsequence.levels > 0 &&
         monster.badConsequence.nVisibleTreasures == 0 &&
         monster.badConsequence.nHiddenTreasures == 0 &&
         monster.badConsequence.visibleTreasures.empty? &&
         monster.badConsequence.hiddenTreasures.empty?
      }
   end

   def greaterLevelPrize(level)
      @monsters.select{|monster| monster.prize.level > 1}
   end

   def treasureKindLoosers(treasure_kind)
      @monsters.select{|monster|
         monster.badConsequence.visibleTreasures.include?(treasure_kind) ||
         monster.badConsequence.hiddenTreasures.include?(treasure_kind)
      }
   end
end

prueba = PruebaNapakalaki.new

greater_10_monsters = prueba.greaterCombatLevel(10)
level_loosers = prueba.levelLoosers
level_earning_greater_1 = prueba.greaterLevelPrize(1)
onehand_loosers = prueba.treasureKindLoosers(TreasureKind::ONEHAND)

puts "\nMonstruos con nivel > 10:\n"
puts greater_10_monsters
puts "\nMonstruos que solo pierden nivel con el mal rollo:\n"
puts level_loosers
puts "\nMonstruos que ganan mas de 1 nivel con el buen rollo:\n"
puts level_earning_greater_1
puts "\nMonstruos que pierden tesoros de 1 mano con el mal rollo:\n"
puts onehand_loosers
=end
