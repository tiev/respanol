module EstudiarEspanol
  module Impresion
    module ClassMethods
      attr_reader :impresion_contar

      def __impresion_contar
        @__impresion_contar ||= 0
        @__impresion_contar += 1
      end

      def impresion(*args)
        print "#{self.name.split('::').last} :#{__impresion_contar} > "
        print(*args)
      end

      def optener
        $stdin.gets.chomp
      end

      def pedir(*args)
        impresion(*args)
        optener
      end

      def decir_que_no
        puts " => No!"
      end

      def felicitar
        puts " => Muy bien!"
      end

      def ensayar(*args)
        impresion(*args)
        loop do
          break if yield(optener)
          decir_que_no
        end
        felicitar
      end
    end

    module InstanceMethods

    end

    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end
  end
end
