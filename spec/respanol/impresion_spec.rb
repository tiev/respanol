RSpec.describe Respanol::Impresion do
  before :all do
    ImpresionKlase = Class.new.include(Respanol::Impresion)
    Klase = Class.new
    Respanol::KlaseInterna = Class.new
  end

  describe '.prefijo' do
    it { expect { ImpresionKlase.prefijo(Klase) }.to output('Klase:: ').to_stdout }
    it { expect { ImpresionKlase.prefijo(Respanol::KlaseInterna) }.to output('KlaseInterna:: ').to_stdout }
  end

  describe '.impresion' do
    it { expect { ImpresionKlase.impresion(Klase, 'test') }.to output('Klase:: test').to_stdout }
  end
end
