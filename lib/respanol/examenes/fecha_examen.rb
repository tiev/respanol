module Respanol
  module Examen
    class FechaExamen < ExamenBase
      def leer(fecha_rango = (Date.civil(1900,1,1)..Date.today))
        fe = rand(fecha_rango)
        ensayar("#{Fecha.fecha_en_palabras(fe)} : ") do |v|
          m = /(\d+)[^\d]+(\d+)[^\d]+(\d+)/.match(v)
          if m
            m[1] == fe.year.to_s && m[2] == fe.month.to_s && m[3] == fe.day.to_s
          end
        end
      end

      def escribir(fecha_rango = (Date.civil(1900,1,1)..Date.today))
        fe = rand(fecha_rango)
        ensayar("Fecha #{fe.strftime('%A %Y-%m-%d')}: ") do |v|
          v.gsub(/\s+/, ' ').strip.downcase == Fecha.fecha_en_palabras(fe).downcase
        end
      end
    end
  end
end
