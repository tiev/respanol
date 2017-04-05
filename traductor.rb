require 'glosbe'

module EstudiarEspanol
  class Traductor
    def self.traductor
      @traductor ||= Glosbe::Translate.new('es', 'en')
    end

    def self.traducir(*args)
      traductor.translate(*args)
    end

    def self.traducir_y_definicion(*args)
      traductor.translate_and_definition(*args)
    end
  end
end
