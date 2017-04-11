module Respanol
  module Impresion
    module ClassMethods
      def prefijo(klase)
        print "#{klase.name.split('::').last}:: "
      end

      def impresion(klase, *args)
        prefijo(klase)
        print(*args)
      end
    end

    module InstanceMethods
      def prefijo(*args)
        self.class.prefijo(*args)
      end

      def impresion(*args)
        self.class.impresion(*args)
      end
    end

    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end
  end
end
