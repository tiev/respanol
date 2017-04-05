require 'readline'

module EstudiarEspanol
  module Impresion
    module ClassMethods
      attr_reader :impresion_contar

      def __impresion_contar
        @__impresion_contar ||= 0
        @__impresion_contar += 1
      end

      def reajustar_impresion
        @__impresion_contar = 0
      end

      def prefijo(contar = false)
        print "#{self.name.split('::').last}::#{" :#{__impresion_contar}" if contar} "
      end

      def impresion(*args)
        prefijo
        print(*args)
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
