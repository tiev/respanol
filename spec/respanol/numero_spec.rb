RSpec.describe Respanol::Numero do
  describe '.numero_en_palabras' do
    it 'works' do
      expect(Respanol::Numero.numero_en_palabras(rand(100))).to be_instance_of(String)
    end

    context 'for number 0' do
      it { expect(Respanol::Numero.numero_en_palabras(0)).to eq('cero') }
    end
  end

  describe '.unirse_palabras' do
    it 'accepts list of strings' do
      expect(Respanol::Numero.unirse_palabras('a', 'b', 'c')).to eq('a b c')
    end
  end

  describe '.unidad' do
    context 'with 1 at end of number string' do
      let(:object) { Respanol::Numero.unidad(1) }
      it { expect(object).to eq('uno') }
    end
    context 'with 1 at middle of number string' do
      let(:object) { Respanol::Numero.unidad(1, false) }
      it { expect(object).to eq('un') }
    end
  end

  describe '.tres_ultimos_en_palabras' do
    context 'for number 100' do
      let(:object) { Respanol::Numero.tres_ultimos_en_palabras(100) }
      it { expect(object).to eq('cien') }
    end
  end

  describe '.dos_ultimos_en_palabras' do
    context 'for number 1..9' do
      let(:object) {
        (1..9).map { |v| Respanol::Numero.dos_ultimos_en_palabras(v) }
      }
      it {
        expect(object).to satisfy('be correct') do |o|
          o.map.with_index(1) do |v, i|
            v == Respanol::Numero::UNIDADES[i]
          end.all?
        end
      }
    end

    context 'for number 1x' do
      let(:object) {
        (11..19).map do |v|
          Respanol::Numero.dos_ultimos_en_palabras(v)
        end
      }
      it {
        expect(object).to satisfy('be correct') do |o|
          o.map.with_index(1) { |v, i| v == Respanol::Numero::DECENA[i] }.all?
        end
      }
    end

    context 'for number 2x' do
      let(:object) {
        (21..29).map do |v|
          Respanol::Numero.dos_ultimos_en_palabras(v)
        end
      }
      it { expect(object).to all(include('vienti')) }
    end

    context 'for numbers >= 3x' do
      let(:object) { Respanol::Numero.dos_ultimos_en_palabras(32) }
      it { expect(object).to include(' y ') }
    end
  end

  describe '.feminino' do
    it { expect(Respanol::Numero.feminino).to equal(Respanol::FemininoNumero) }
  end
end

RSpec.describe Respanol::FemininoNumero do
  describe '.unidad' do
    context 'with 1' do
      let(:object) { [Respanol::FemininoNumero.unidad(1), Respanol::FemininoNumero.unidad(1, false)] }
      it { expect(object).to all(eq('una')) }
    end
  end

  describe '.tres_ultimos_en_palabras' do
    context 'with hundred numbers' do
      let(:object) {
        (200..900).step(100).map { |v| Respanol::FemininoNumero.tres_ultimos_en_palabras(v) }
      }
      it { expect(object).to all(end_with('ientas')) }
    end
  end
end
