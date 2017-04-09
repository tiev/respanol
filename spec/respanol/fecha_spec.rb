RSpec.describe Respanol::Fecha do
  describe '.fecha_en_palabras' do
    it 'works' do
      expect(Respanol::Fecha.fecha_en_palabras(Date.new(2001,1,1))).to eq('Lunes uno de Enero de dos mil uno')
    end
  end
end
