module EstudiarEspanol
  class Ano
    include Impresion

    MESES = %W{ #{''}
      Enero Febrero Marzo Abril Mayo Junio
      Julio Agosto Septiembre Octubre Noviembre Diciembre
    }

    def self.leer(conde = nil)
      Test.gaza(*[conde].compact) do |t|
        mes = MESES.sample
        t.ensayar("#{mes} indice in Vietnamita es ") do |v|
          v.to_i == (MESES.find_index(mes))
        end
      end
    end

    def self.escribir(conde = nil)
      indices = (1..(MESES.size - 1)).to_a
      Test.gaza(*[conde].compact) do |t|
        indice = indices.sample
        ensayar("Mes indice #{indice} es ") do |v|
          MESES[indice].downcase == v.downcase
        end
      end
    end
  end
end
