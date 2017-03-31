module EstudiarEspanol
  module Verbo
    class VerboBase
      CONJUGACION = []

      def self.aleatorio(klase = nil)
        klases = Array(klase)
        klases << self if klases.empty?

        count = 0
        while true
          count += 1
          klase = klases.sample
          short_name = klase.name.split('::').last
          pro = Pronombre.todos.sample
          print "#{short_name} :#{count} > #{pro} "
          v = $stdin.gets.chomp
          while klase::CONJUGACION.find_index(v) != Pronombre.verbo_indice(pro)
            puts " => No!"
            v = $stdin.gets.chomp
          end
          puts " => Muy bien!"
        end
      end
    end
  end
end
