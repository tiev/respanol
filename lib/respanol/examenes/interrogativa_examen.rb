module Respanol
  module Examen
    class InterrogativaExamen < ExamenBase
      FRASES = %W[
        Who #{'Who (plural)'} Where #{'Where (specific)'} How When
        #{'How many (masculine)'} #{'How many (masculine, plural)'}
        #{'How many (feminine)'} #{'How many (feminine, plural)'}
        Why What Which #{'Which (plural)'}
      ]

      def test
        frase = FRASES.sample
        indice = FRASES.index(frase)
        ensayar("#{frase} = ") do |v|
          emparejar?(v, Interrogativa::FRASES[indice])
        end
      end
    end
  end
end
