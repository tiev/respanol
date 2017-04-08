module Respanol
  module Verbo
    class VerboBase
      include ::Respanol::Impresion,
        ::Respanol::Traducir

      CONJUGACION = []

      def self.conjugado(klase = nil, conde = nil)
        klases = Array(klase)
        klases << self if klases.empty?

        Test.gaza(*[conde].compact) do |t|
          klase = klases.sample
          pro = Pronombre.todos.sample
          klase.prefijo
          t.ensayar("#{pro} ") do |v|
            klase::CONJUGACION.find_index(v) == Pronombre.verbo_indice(pro)
          end
        end
      end
    end
  end
end
