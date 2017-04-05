module EstudiarEspanol
  module Traducir
    module ClassMethods
      def definicion
        nombre = self.name.split('::').last.downcase
        @definicion ||= Traductor.traducir_y_definicion(nombre)
        puts @definicion[:translated]
        puts "--EN--"
        puts @definicion[:target_definitions].join("\n")
        puts "--ES--"
        puts @definicion[:source_definitions].join("\n")
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
