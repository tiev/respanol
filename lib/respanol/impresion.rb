module Respanol
  module Impresion
    module ClassMethods
      def prefijo
        print "#{self.name.split('::').last}:: "
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
