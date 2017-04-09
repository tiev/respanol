module Respanol
  class Hora
    def self.responder_hora_en_palabras(hora)
      "#{comienzo(hora)} #{hora_en_palabras(hora)}"
    end

    def self.comienzo(hora)
      h = hora.hour % 12
      m = hora.min
      if h == 1 && m <= 30
        "Es la"
      else
        "Son las"
      end
    end

    def self.hora_en_palabras(hora)
      h = hora.hour % 12
      m = hora.min
      s_h = if m <= 30
              FemininoNumero.numero_en_palabras(h)
            else
              FemininoNumero.numero_en_palabras(h + 1)
            end
      s_m = case m
            when 0
              'en punto'
            when 15
              'y cuarto'
            when 30
              'y media'
            else
              if m < 30
                "y #{FemininoNumero.numero_en_palabras(m)}"
              else
                "menos #{FemininoNumero.numero_en_palabras(60 - m)}"
              end
            end

      "#{s_h} #{s_m}"
    end
  end
end
