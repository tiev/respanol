module Respanol
  module Examen
    class AnoExamen < ExamenBase
      def leer
        mes = Ano::MESES.sample
        ensayar("#{mes} indice in Vietnamita es ") do |v|
          v.to_i == (Ano::MESES.find_index(mes))
        end
      end

      def escribir
        indices = (1..(Ano::MESES.size - 1)).to_a
        indice = indices.sample
        ensayar("Mes indice #{indice} es ") do |v|
          Ano::MESES[indice].downcase == v.downcase
        end
      end
    end
  end
end
