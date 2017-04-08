module Respanol
  class Test
    include ::Respanol::Impresion

    GAZA_CONDE = 50

    attr_accessor :indice

    def self.gaza(conde = GAZA_CONDE)
      comienzo = Time.now
      res = conde.times.map do |c|
        print ":#{c} "
        yield(new(c))
      end.select { |r| r != false }.count
      puts "Exito: #{res} / #{conde}. En #{(Time.now - comienzo).round} segundos!"

      res
    end

    def initialize(indice = nil)
      self.indice = indice
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
