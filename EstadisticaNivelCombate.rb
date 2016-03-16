#encoding: utf-8
#EXAMEN

require_relative 'Monster'

class EstadisticaNivelCombate

   #Inicializador
   def initialize(lista_monstruos, max_nivel, min_nivel, media_nivel)
      @monstruos = lista_monstruos
      @max_nivel = max_nivel
      @min_nivel = min_nivel
      @media_nivel = media_nivel
   end

   def EstadisticaNivelCombate.newEstadistica(lista_monstruos)
      #Calcula media
      lista_monstruos.each{|monstruo| media = media + monstruo.level}
      media = media/lista_monstruos.length
      #Calcula max
      maximo = lista_monstruos[0].level
      lista_monstruos.each{|monstruo|
         if monstruo.level > maximo
            maximo = monstruo.level
         end
      }
      #Calcula min
      minimo = lista_monstruos[0].level
      lista_monstruos.each{|monstruo|
         if monstruo.level < minimo
            minimo = monstruo.level
         end
      }
      #Inicializa el objeto
      new(lista_monstruos, maximo, minimo, media)
   end

   attr_reader :monstruos, :max_nivel, :min_nivel, :media_nivel

   def to_s
      cadena = "Nombres de los monstruos:\n"
      @monstruos.each{|monstruo|
         cadena += "\t" + monstruo.name + "\n"
      }
      cadena += "Nivel Minimo: #{@min_nivel}\n Nivel Maximo: #{@max_nivel}\n Nivel Medio#{@media_nivel}"
      return cadena
   end

   private_class_method :new
end
#FIN EXAMEN
