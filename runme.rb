#encoding: utf-8

#EXAMEN
require_relative "Player"
require_relative "CultistPlayer"
require_relative "Cultist"
require_relative "GoodMonster"
require_relative "Monster"

module NapakalakiGame

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

jugador1 = Player.new(jugador1)

bc = DeathBadConsequence.new(textos_bc["hondos"])
prize = Prize.new(2, 1)
monstruo1 = GoodMonster.new("Los hondos", 8, bc, prize, jugador1)
monstruo2 = Monster.new("Los hondos", 8, bc, prize)

jugador1.getOponentLevel(monstruo1)
jugador1.getOponentLevel(monstruo2)

carta = Cultist.new("Agaricus", 1)
jugador2 = CultistPlayer.new(jugador1, carta)


end

#FIN EXAMEN
