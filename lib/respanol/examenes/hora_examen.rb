module Respanol
  module Examen
    class HoraExamen < ExamenBase
      def leer(from = 0, to = 24)
        fe = Date.today
        ho = Time.local(fe.year, fe.month, fe.day, rand(from..to), rand(0..60), rand(0..60))
        ensayar("#{Hora.responder_hora_en_palabras(ho)} = ") do |v|
          m = /(\d+)[^\d]+(\d+)/.match(v)
          if m
            m[1].to_i == (ho.hour % 12) && m[2].to_i == ho.min
          end
        end
      end

      def escribir(from = 0, to = 24)
        fe = Date.today
        ho = Time.local(fe.year, fe.month, fe.day, rand(from..to), rand(0..60), rand(0..60))
        ensayar("#{ho.strftime('%I:%M:%S %p')} = ") do |v|
          v.gsub(/\s+/, ' ').strip.downcase ==
            Hora.responder_hora_en_palabras(ho).downcase
        end
      end
    end
  end
end
