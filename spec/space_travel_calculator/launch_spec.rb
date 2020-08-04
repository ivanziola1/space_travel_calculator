# frozen_string_literal: false

RSpec.describe SpaceTravelCalculator::Launch do
  describe '.calculate' do
    let(:equipment_weight) { 1 }
    let(:gravity) { 0 }

    let(:result) { SpaceTravelCalculator::Launch.calculate(equipment_weight, gravity) }

    context 'when launching from Earth' do
      let(:equipment_weight) { 28_801 }
      let(:gravity) { 9.807 }
      let(:expected_result) { 19_772 }

      it 'returns correct result' do
        expect(result).to be_eql(expected_result)
      end
    end

    context 'when launching from Mars' do
      let(:equipment_weight) { 28_801 }
      let(:gravity) { 3.711 }
      let(:expected_result) { 5_186 }

      it 'returns correct result' do
        expect(result).to be_eql(expected_result)
      end
    end

    context 'when launching from Moon' do
      let(:equipment_weight) { 28_801 }
      let(:gravity) { 1.62 }
      let(:expected_result) { 2_024 }

      it 'returns correct result' do
        expect(result).to be_eql(expected_result)
      end
    end
  end
end