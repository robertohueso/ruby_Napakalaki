#encoding: utf-8
#EXAMEN
require_relative "Referee"
require_relative "Monster"
require_relative "BadConsequence"
require_relative "Prize"

module P2
   class P2
      def P2.examen
         referee = NapakalakiGame::Referee.getInstance
         puts referee.judge(-1)
         puts referee.judge(3)
         puts referee.judge(7)

         bc = NapakalakiGame::BadConsequence.newLevelSpecificTreasures("Este es un espia",
               0, [NapakalakiGame::TreasureKind::HELMET], [])
         prize = NapakalakiGame::Prize.new(1, 1)
         monstruo1 = NapakalakiGame::Monster.new("El Espia", 5, bc, prize)

         bc = NapakalakiGame::BadConsequence.newLevelNumberOfTreasures("Este es un lenguas", 3, 5, 0)
         prize = NapakalakiGame::Prize.new(1, 1)
         monstruo2 = NapakalakiGame::Monster.new("El lenguas", 20, bc, prize)

         bc = NapakalakiGame::NapakalakiGame::BadConsequence.newLevelSpecificTreasures("Soy un bicefalo",
               0, [NapakalakiGame::TreasureKind::BOTHHANDS, NapakalakiGame::TreasureKind::ONEHAND, NapakalakiGame::TreasureKind::ONEHAND], [])
         prize = NapakalakiGame::Prize.new(1, 1)
         monstruo3 = NapakalakiGame::Monster.new("Bicefalo", 20, bc, prize)

         puts monstruo3.getNumberOfMonsters
      end
   end
end
#FIN EXAMEN
