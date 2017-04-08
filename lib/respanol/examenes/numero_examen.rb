module Respanol
  module Examen
    class NumeroExamen < ExamenBase
      attr_accessor :klase

      MAXIMO = 100

      def initialize(feminino = false)
        @klase = feminino ? FemininoNumero : Numero
      end

      def feminino
        dup = self.dup
        dup.klase = FemininoNumero
        dup
      end

      def feminino!
        self.klase = FemininoNumero
        self
      end

      def leer(rango = (1...MAXIMO))
        num = rand(rango)
        ensayar("#{@klase.numero_en_palabras(num)} = ") do |v|
          v.to_i == num
        end
      end

      def escribir(rango = (1...MAXIMO))
        num = rand(rango)
        ensayar("#{num} = ") do |s|
          s.gsub(/\s+/, ' ').strip == @klase.numero_en_palabras(num)
        end
      end
    end
  end
end
