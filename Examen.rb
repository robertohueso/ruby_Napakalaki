#EXAMEN
require_relative "Napakalaki"

module NapakalakiGame
class Examen
  def run
    #Jugador 1
    jugador1 = Player.new("Jugador 1")
    tesoros_j1 = []

    #Tesoros
    tesoros_j1 << Treasure.new("Hacha prehistórica", 2, TreasureKind::ONEHAND)
    tesoros_j1 << Treasure.new("¡Sí mi amo!",4,TreasureKind::HELMET)
    tesoros_j1 << Treasure.new("Botas de lluvia ácida",1, TreasureKind::BOTHHANDS)
    tesoros_j1 << Treasure.new("Botas de investigación",3,TreasureKind::SHOES)
    tesoros_j1 << Treasure.new("Clavo de rail ferroviario",3, TreasureKind::ONEHAND)
    tesoros_j1 << Treasure.new("Fez alópodo", 3, TreasureKind::HELMET)
    jugador1.setHiddenTreasures(tesoros_j1)


    for tesoro in tesoros_j1
      jugador1.makeTreasureVisible(tesoro)
      puts jugador1.to_s + "Hidden #{jugador1.getHiddenTreasures}\n
          Visible #{jugador1.getVisibleTreasures}\n------------------------"
    end
    puts "NIVEL DE COMBATE FINAL: #{jugador1.getCombatLevelExamen}"

    #_________________________________________________________________________
    #Jugador 2

    jugador2 = Player.new("Jugador 2")
    tesoros_j2_visible = []
    tesoros_j2_hidden = []

    #Tesoros

    tesoros_j2_visible << Treasure.new("Clavo de rail ferroviario",0, TreasureKind::ONEHAND)
    tesoros_j2_visible << Treasure.new("Casco minero", 0, TreasureKind::HELMET)
    jugador2.setVisibleTreasures(tesoros_j2_visible)

    tesoros_j2_hidden << Treasure.new("Botas de lluvia ácida",0, TreasureKind::BOTHHANDS)
    tesoros_j2_hidden << Treasure.new("A prueba de babas",0,TreasureKind::ARMOR)
    tesoros_j2_hidden << Treasure.new("Botas de investigación",0,TreasureKind::SHOES)
    jugador2.setHiddenTreasures(tesoros_j2_hidden)

    #Combates
    monstruos = []
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

    bc = BadConsequence.newLevelSpecificTreasures(textos_bc["bicefalo"],
          0, [TreasureKind::BOTHHANDS, TreasureKind::ONEHAND, TreasureKind::ONEHAND], [])
    prize = Prize.new(1, 1)
    monstruos << Monster.new("Bicefalo", 20, bc, prize)

    bc = BadConsequence.newLevelNumberOfTreasures(textos_bc["semillas"], 2, 0, 2)
    prize = Prize.new(2, 1)
    monstruos << Monster.new("Semillas de Cthulhu", 4, bc, prize)

    bc = BadConsequence.newDeath(textos_bc["hondos"])
    prize = Prize.new(2, 1)
    monstruos << Monster.new("Los hondos", 8, bc, prize)

    puts jugador2.combat(monstruos[0])
    puts jugador2.to_s
    puts jugador2.combat(monstruos[1])
    puts jugador2.to_s
    puts jugador2.combat(monstruos[2])
    puts jugador2.to_s

  end
end
end
#FIN EXAMEN
