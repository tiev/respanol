RSpec.describe Respanol::Hora do
  describe '.comienzo' do
    context 'when time at 1 hour' do
      it { expect(Respanol::Hora.comienzo(Time.parse('1:0'))).to eq('Es la') }
    end
    context 'when time at more than 1:30' do
      it { expect(Respanol::Hora.comienzo(Time.parse('1:31'))).to eq('Son las') }
    end
  end

  describe '.hora_en_palabras' do
    context 'at exact hour' do
      it { expect(Respanol::Hora.hora_en_palabras(Time.parse('2:0'))).to include('en punto') }
    end

    context 'at a quarter' do
      it { expect(Respanol::Hora.hora_en_palabras(Time.parse('2:15'))).to include('y cuarto') }
    end

    context 'at half hour' do
      it { expect(Respanol::Hora.hora_en_palabras(Time.parse('2:30'))).to include('y media') }
    end

    context 'at minus hour' do
      it { expect(Respanol::Hora.hora_en_palabras(Time.parse('2:31'))).to include('menos') }
    end
  end
end
