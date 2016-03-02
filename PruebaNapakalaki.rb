require_relative 'Monster'

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
         "Roboggoth" => "La quinta directiva primaria te obliga a perder 2 niveles y 2 tesoros de una mano visibles"
      }
      @monstruos = Array.new

      bc = BadConsequence.newLevelSpecificTreasures(@textos_bc["Byakhees"],
            0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
      prize = Prize.new(2, 1)
      @monstruos << Monster.new("Byakhees de bonanza", 8, bc, prize)

      bc = BadConsequence.newLevelSpecificTreasures(@textos_bc["Chibithulhu"],
            0, [TreasureKind::HELMET], [])
      prize = Prize.new(1, 1)
      @monstruos << Monster.new("Chibithulhu", 2, bc, prize)

      bc = BadConsequence.newLevelSpecificTreasures(@textos_bc["sopor"],
            0, [TreasureKind::SHOES], [])
      prize = Prize.new(1, 1)
      @monstruos << Monster.new("El sopor de Dunwich", 2, bc, prize)

      bc = BadConsequence.newLevelSpecificTreasures(@textos_bc["angeles"],
            0, [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
      prize = Prize.new(4, 1)
      @monstruos << Monster.new("Angeles de la noche ibicenca", 14, bc, prize)

      bc = BadConsequence.newLevelNumberOfTreasures(@textos_bc["gorron"], 0, 10, 0)
      prize = Prize.new(3, 1)
      @monstruos << Monster.new("El gorron en el umbral", 10, bc, prize)

      bc = BadConsequence.newLevelSpecificTreasures(@textos_bc["hp"],
            0, [TreasureKind::ARMOR], [])
      prize = Prize.new(2, 1)
      @monstruos << Monster.new("H.P Munchcraft", 6, bc, prize)

      bc = BadConsequence.newLevelSpecificTreasures(@textos_bc["Bichgooth"],
            0, [TreasureKind::ARMOR], [])
      prize = Prize.new(1, 1)
      @monstruos << Monster.new("Bichgooth", 2, bc, prize)

      bc = BadConsequence.newLevelNumberOfTreasures(@textos_bc["rey"], 5, 3, 0)
      prize = Prize.new(4, 2)
      @monstruos << Monster.new("El rey rosa", 13, bc, prize)

      bc = BadConsequence.newLevelNumberOfTreasures(@textos_bc["redacta"], 2, 0, 0)
      prize = Prize.new(1, 1)
      @monstruos << Monster.new("La que redacta en las tinieblas", 2, bc, prize)

      bc = BadConsequence.newDeath(@textos_bc["hondos"])
      prize = Prize.new(2, 1)
      @monstruos << Monster.new("Los hondos", 8, bc, prize)

      bc = BadConsequence.newLevelNumberOfTreasures(@textos_bc["semillas"], 2, 0, 2)
      prize = Prize.new(2, 1)
      @monstruos << Monster.new("Semillas de Cthulhu", 4, bc, prize)

      bc = BadConsequence.newLevelSpecificTreasures(@textos_bc["dameargo"],
            0, [TreasureKind::ONEHAND], [])
      prize = Prize.new(2, 1)
      @monstruos << Monster.new("Dameargo", 1, bc, prize)

      bc = BadConsequence.newLevelNumberOfTreasures(@textos_bc["pollipolipo"], 3, 0, 0)
      prize = Prize.new(1, 1)
      @monstruos << Monster.new("Pollipolipo volante", 3, bc, prize)

      bc = BadConsequence.newDeath(@textos_bc["Yskhtihyssg"])
      prize = Prize.new(3, 1)
      @monstruos << Monster.new("Yskhtihyssg-Goth", 12, bc, prize)

      bc = BadConsequence.newDeath(@textos_bc["familia"])
      prize = Prize.new(4, 1)
      @monstruos << Monster.new("Familia Feliz", 1, bc, prize)

      bc = BadConsequence.newLevelSpecificTreasures(@textos_bc["Roboggoth"],
            2, [TreasureKind::ONEHAND, TreasureKind::ONEHAND], [])
      prize = Prize.new(2, 1)
      @monstruos << Monster.new("Roboggoth", 8, bc, prize)
   end
end

prueba = PruebaNapakalaki.new
