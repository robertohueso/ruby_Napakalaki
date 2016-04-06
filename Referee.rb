#encoding: utf-8

#EXAMEN
require_relative "Dice"

module NapakalakiGame
   class Referee
      private
      def initialize(name)
         @name = name
         @@instance = nil
      end

      public
      def Referee.getInstance()
         if defined? @@instance
            return @@instance
         else
            @@instance = new("Referee")
            return @@instance
         end
      end

      def getName()
         return @name
      end

      def judge(i)
         dice = Dice.getInstance
         number = dice.nextNumber
         if i < number
            return true
         else
            return false
         end
      end
   end
end
#FIN EXAMEN
