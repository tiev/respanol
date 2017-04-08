module Respanol
  class Pronombre
    YO = 'Yo'
    TU = 'Tu'
    EL = 'El'
    ELLA = 'Ella'
    USTED = 'Usted'
    NOSOTROS = 'Nosotros'
    NOSOTRAS = 'Nosotras'
    VOSOTROS = 'Vosotros'
    VOSOTRAS = 'Vosotras'
    ELLOS = 'Ellos'
    ELLAS = 'Ellas'
    USTEDES = 'Ustedes'

    def self.todos
      @all ||= [YO, TU, EL, ELLA, USTED, NOSOTROS, NOSOTRAS, VOSOTROS, VOSOTRAS, ELLOS, ELLAS, USTEDES]
    end

    def self.plurals
      @plurals ||= [NOSOTROS, NOSOTRAS, VOSOTROS, VOSOTRAS, ELLOS, ELLAS, USTEDES]
    end

    def self.plural?(pro)
      plurals.include?(pro)
    end

    def self.singulars
      @singulars ||= [YO, TU, EL, ELLA, USTED]
    end

    def self.singular?(pro)
      singulars.include?(pro)
    end

    def self.primera?(pro)
      [YO, NOSOTROS, NOSOTRAS].include?(pro)
    end

    def self.segunda?(pro)
      [TU, VOSOTROS, VOSOTRAS].include?(pro)
    end

    def self.tercera?(pro)
      [El, ELLA, USTED, ELLOS, ELLAS, USTEDES].include?(pro)
    end

    def self.singular_primera?(pro)
      pro == YO
    end

    def self.singular_segunda?(pro)
      pro == TU
    end

    def self.singular_tercera?(pro)
      [EL, ELLA, USTED].include?(pro)
    end

    def self.plural_primera?(pro)
      [NOSOTROS, NOSOTRAS].include?(pro)
    end

    def self.plural_segunda?(pro)
      [VOSOTROS, VOSOTRAS].include?(pro)
    end

    def self.plural_tercera?(pro)
      [ELLOS, ELLAS, USTEDES].include?(pro)
    end

    def self.verbo_indice(pro)
      metodos = [
        :singular_primera?, :singular_segunda?, :singular_tercera?,
        :plural_primera?, :plural_segunda?, :plural_tercera?
      ]

      metodos.find_index { |m| self.send(m, pro) }
    end
  end
end
