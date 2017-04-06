module EstudiarEspanol
  class Numero
    include Impresion

    UNIDADES = %w( cero uno dos tres cuatro cinco seis siete ocho nueve )
    DECENA = %w( diez once doce trece catorce quince dieciseis diecisiete dieciocho diecinueve )
    DECENAS = %W( #{''} diez viente treinta cuarenta cincuenta sesenta setenta ochenta noventa )
    CENTENARES = %W( #{''} ciento doscientos trescientos cuatrocientos quinientos seiscientos setecientos ochocientos novecientos )
    UNO_APOCOPE = 'un'
    UNIDAD_1K = 'mil'
    UNIDAD_1M = 'millon'
    DECIMAL = 'coma'
    MAXIMO = 100

    def self.feminino
      FemininoNumero
    end

    def self.leer(rango = (1...MAXIMO), conde = nil)
      Test.gaza(*[conde].compact) do |t|
        num = rand(rango)
        t.ensayar("#{numero_en_palabras(num)} = ") do |v|
          v.to_i == num
        end
      end
    end

    def self.escribir(rango = (1...MAXIMO), conde = nil)
      Test.gaza(*[conde].compact) do |t|
        num = rand(rango)
        t.ensayar("#{num} = ") do |s|
          s.gsub(/\s+/, ' ').strip == numero_en_palabras(num)
        end
      end
    end

    def self.unirse_palabras(ps)
      ps.join(' ').gsub(/\s+/, ' ').strip
    end

    def self.numero_en_palabras(num)
      return self::UNIDADES[0] if num == 0

      s_ultimos_3 = unirse_palabras(tres_ultimos_en_palabras(num))

      if num >= 1000
        mil = (num % 1_000_000) / 1000
        s_mil = case mil
                when 0
                  ''
                when 1
                  UNIDAD_1K
                else
                  "#{unirse_palabras(tres_ultimos_en_palabras(mil, false))} #{UNIDAD_1K}"
                end
      end

      if num >= 1_000_000
        millon = (num % 1_000_000_000) / 1_000_000
        s_millon = case millon
        when 1
          "#{self::UNO_APOCOPE} #{UNIDAD_1M}"
        else
          "#{unirse_palabras(tres_ultimos_en_palabras(millon, false))} millones"
        end
      end

      unirse_palabras([s_millon, s_mil, s_ultimos_3])
    end

    def self.dos_ultimos_en_palabras(num, es_unidad = true)
      ultimos_2 = num % 100
      ultimo = ultimos_2 % 10
      case ultimos_2 / 10
      when 2
        ultimo == 0 ? DECENAS[2] : "vienti#{unidad(ultimo, es_unidad)}"
      when 1
        DECENA[ultimo]
      else
        s = "#{DECENAS[ultimos_2 / 10]}"
        s = s + "#{' y ' if (ultimos_2 / 10 >= 3)}#{unidad(ultimo, es_unidad)}" if ultimo > 0
        s
      end
    end

    def self.tres_ultimos_en_palabras(num, es_unidad = true)
      return 'cien' if (num % 1000) == 100

      s_ultimos_2 = dos_ultimos_en_palabras(num, es_unidad)
      s_centenar = self::CENTENARES[(num % 1000) / 100] if num >= 100
      [s_centenar, s_ultimos_2]
    end

    def self.unidad(num, es_unidad = true)
      ultimo = num % 10
      return self::UNO_APOCOPE if !es_unidad && ultimo == 1

      self::UNIDADES[ultimo]
    end
  end

  class FemininoNumero < Numero
    UNIDADES = %w( cero una dos tres cuatro cinco seis siete ocho nueve )
    CENTENARES = %W( #{''} ciento doscientas trescientas cuatrocientas quinientas seiscientas setecientas ochocientas novecientas )
    UNO_APOCOPE = 'una'
  end
end
