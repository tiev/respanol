module Respanol
  class Fecha
    def self.leer(fecha_rango = (Date.civil(1900,1,1)..Date.today), conde = nil)
      Test.gaza(*[conde].compact) do |t|
        fe = rand(fecha_rango)
        t.ensayar("#{fecha_en_palabras(fe)} : ") do |v|
          m = /(\d+)[^\d]+(\d+)[^\d]+(\d+)/.match(v)
          if m
            m[1] == fe.year.to_s && m[2] == fe.month.to_s && m[3] == fe.day.to_s
          end
        end
      end
    end

    def self.escribir(fecha_rango = (Date.civil(1900,1,1)..Date.today), conde = nil)
      Test.gaza(*[conde].compact) do |t|
        fe = rand(fecha_rango)
        t.ensayar("Fecha #{fe.strftime('%A %Y-%m-%d')}: ") do |v|
          v.gsub(/\s+/, ' ').strip.downcase == fecha_en_palabras(fe).downcase
        end
      end
    end

    def self.fecha_en_palabras(fecha)
      dia = Semana::DIAS[fecha.wday]
      fecha_numero = Numero.numero_en_palabras(fecha.mday)
      mes = Ano::MESES[fecha.month]
      ano = Numero.numero_en_palabras(fecha.year)

      [dia, fecha_numero, 'de', mes, 'de', ano].join(' ')
    end
  end
end
