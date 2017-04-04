module EstudiarEspanol
  class Semana
    include Impresion

    DIAS = %w{
      Lunes
      Martes
      Miercoles
      Jueves
      Viernes
      Sabado
      Domingo
    }

    def self.leer
      while true
        dia = DIAS.sample
        ensayar("#{dia} indice in Vietnam es ") do |v|
          v.to_i == (DIAS.find_index(dia) + 2)
        end
      end
    end

    def self.hablar
      indices = (0..(DIAS.size - 1)).to_a
      while true
        indice = indices.sample
        ensayar("dia indice #{indice + 2} es ") do |v|
          DIAS[indice].downcase == v.downcase
        end
      end
    end
  end
end
