module Respanol
  class Fecha
    def self.fecha_en_palabras(fecha)
      dia = Semana::DIAS[fecha.wday]
      fecha_numero = Numero.numero_en_palabras(fecha.mday)
      mes = Ano::MESES[fecha.month]
      ano = Numero.numero_en_palabras(fecha.year)

      [dia, fecha_numero, 'de', mes, 'de', ano].join(' ')
    end
  end
end
