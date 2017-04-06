module EstudiarEspanol
  class Semana
    include Impresion

    DIAS = %w{
      Domingo
      Lunes
      Martes
      Miercoles
      Jueves
      Viernes
      Sabado
      Domingo
    }

    def self.leer(conde = nil)
      Test.gaza(*[conde].compact) do |t|
        dia = DIAS.sample
        t.ensayar("#{dia} indice in Vietnamita es ") do |v|
          v.to_i == (DIAS.find_index(dia) + 1)
        end
      end
    end

    def self.escribir(conde = nil)
      indices = (0..(DIAS.size - 2)).to_a
      Test.gaza(*[conde].compact) do |t|
        indice = indices.sample
        t.ensayar("dia indice #{indice + 1} es ") do |v|
          DIAS[indice].downcase == v.downcase
        end
      end
    end
  end
end
