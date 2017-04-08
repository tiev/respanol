module Respanol
  module Examen
    class ExamenBase
      include ::Respanol::Impresion

      GAZA_CONDE = 50

      def self.gaza(conde = GAZA_CONDE, instancia = nil)
        comienzo = Time.now
        res = conde.times.map do |c|
          print ":#{c} "
          yield(instancia || self.new)
        end.select { |r| r != false }.count
        puts "Exito: #{res} / #{conde}. En #{(Time.now - comienzo).round} segundos!"

        res
      end

      def gaza(conde = GAZA_CONDE)
        self.class.gaza(conde, self, &Proc.new)
      end

      def ensayar(*args)
        print "> "
        exito = true
        loop do
          break if yield(pedir(*args))
          decir_que_no
          exito = false
        end
        felicitar

        exito
      end

      def pedir(*args)
        Readline.readline(*args)
      end

      def optener
        $stdin.gets.chomp
      end

      def decir_que_no
        puts " => No!"
      end

      def felicitar
        puts " => Muy bien!"
      end
    end
  end
end
