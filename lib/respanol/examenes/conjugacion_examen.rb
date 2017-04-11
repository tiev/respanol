module Respanol
  module Examen
    class ConjugacionExamen < ExamenBase
      def initialize(verbos = nil)
        @verbos = Array(verbos)
      end

      def conjugado(klase = nil)
        klases = @verbos
        klases = klases | Array(klase) unless klase.nil?
        kl = klases.sample
        pro = Pronombre.todos.sample
        prefijo(kl)
        ensayar("#{pro} ") do |v|
          kl::CONJUGACION.find_index(v) == Pronombre.verbo_indice(pro)
        end
      end
    end
  end
end
