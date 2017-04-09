RSpec.describe Respanol::Impresion do
  before :all do
    Klase = Class.new.include(Respanol::Impresion)
    Respanol::KlaseInterna = Class.new.include(Respanol::Impresion)
  end

  describe '.prefijo' do
    it { expect { Klase.prefijo }.to output('Klase:: ').to_stdout }
    it { expect { Respanol::KlaseInterna.prefijo }.to output('KlaseInterna:: ').to_stdout }
  end

  describe '.impresion' do
    it { expect { Klase.impresion('test') }.to output('Klase:: test').to_stdout }
  end
end
