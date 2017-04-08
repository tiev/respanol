module Respanol
  module Examen
    class SemanaExamen < ExamenBase
      def leer
        dia = Semana::DIAS.sample
        ensayar("#{dia} indice in Vietnamita es ") do |v|
          v.to_i == (Semana::DIAS.find_index(dia) + 1)
        end
      end

      def escribir
        indices = (0..(Semana::DIAS.size - 2)).to_a
        indice = indices.sample
        ensayar("dia indice #{indice + 1} es ") do |v|
          Semana::DIAS[indice].downcase == v.downcase
        end
      end
    end
  end
end
