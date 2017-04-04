module EstudiarEspanol
  module Verbo
    class VerboBase
      include ::EstudiarEspanol::Impresion

      CONJUGACION = []

      def self.aleatorio(klase = nil)
        klases = Array(klase)
        klases << self if klases.empty?

        while true
          klase = klases.sample
          pro = Pronombre.todos.sample
          klase.ensayar("#{pro} ") do |v|
            klase::CONJUGACION.find_index(v) == Pronombre.verbo_indice(pro)
          end
        end
      end
    end
  end
end
