module Respanol
  module Traducir
    module ClassMethods
      def definicion
        nombre = self.name.split('::').last.downcase
        @definicion ||= Traductor.traducir_y_definicion(nombre)

        tpl = " | %s"
        o = ["=> #{@definicion[:translated]}"]
        o << " *---INGLÉS----------"
        @definicion[:target_definitions].each do |d|
          o << tpl % d
        end
        o << " *---ESPAÑOL----------"
        @definicion[:source_definitions].each do |d|
          o << tpl % d
        end

        puts o.join("\n")
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
