# frozen_string_literal: false

RSpec.describe SpaceTravelCalculator::Landing do
  describe '.calculate' do
    let(:equipment_weight) { 1 }
    let(:gravity) { 0 }

    let(:result) { SpaceTravelCalculator::Landing.calculate(equipment_weight, gravity) }

    context 'when landing on Earth' do
      let(:equipment_weight) { 28_801 }
      let(:gravity) { 9.807 }
      let(:expected_result) { 13_447 }

      it 'returns correct result' do
        expect(result).to be_eql(expected_result)
      end
    end

    context 'when landing on Mars' do
      let(:equipment_weight) { 28_801 }
      let(:gravity) { 3.711 }
      let(:expected_result) { 3_874 }

      it 'returns correct result' do
        expect(result).to be_eql(expected_result)
      end
    end

    context 'when landing on Moon' do
      let(:equipment_weight) { 28_801 }
      let(:gravity) { 1.62 }
      let(:expected_result) { 1_535 }

      it 'returns correct result' do
        expect(result).to be_eql(expected_result)
      end
    end
  end
end
