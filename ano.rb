module EstudiarEspanol
  class Ano
    include Impresion

    MESES = %w{
      Enero Febrero Marzo Abril Mayo Junio
      Julio Agosto Septiembre Octubre Noviembre Diciembre
    }

    def self.leer
      while true
        mes = MESES.sample
        ensayar("#{mes} indice in Vietnam es ") do |v|
          v.to_i == (MESES.find_index(mes) + 1)
        end
      end
    end

    def self.escribir
      indices = (0..(MESES.size - 1)).to_a
      while true
        indice = indices.sample
        ensayar("Mes indice #{indice + 1} es ") do |v|
          MESES[indice].downcase == v.downcase
        end
      end
    end
  end
end
