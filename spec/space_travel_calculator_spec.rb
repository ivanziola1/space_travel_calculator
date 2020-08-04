# frozen_string_literal: false

RSpec.describe SpaceTravelCalculator do
  it 'has a version number' do
    expect(SpaceTravelCalculator::VERSION).not_to be nil
  end

  describe '.fuel' do
    let(:equipment_weight) { 1 }
    let(:travels) { [] }
    let(:result) { subject.fuel(equipment_weight, travels) }

    context 'when mass is invalid' do
      let(:equipment_weight) { -2 }

      it 'should fail' do
        expect { result }.to raise_error(SpaceTravelCalculator::InvalidInputError, /weight is invalid/)
      end
    end

    context 'when travels array empty' do
      it 'should fail' do
        expect { result }.to raise_error(SpaceTravelCalculator::InvalidInputError, /is not an array/)
      end
    end

    context 'when travels array contains to many values' do
      let(:travels) { [[:land, 1231, 3213]] }

      it 'should fail' do
        expect { result }.to raise_error(SpaceTravelCalculator::InvalidInputError, /length is invalid/)
      end
    end

    context 'when travels array contains invalid operation' do
      let(:travels) { [[:invalid_operation, 3213]] }

      it 'should fail' do
        expect { result }.to raise_error(SpaceTravelCalculator::UnpermittedOperationError, /Unpermitted operation/)
      end
    end

    context 'when travels array contains invalid gravity' do
      let(:travels) { [[:launch, 3213]] }

      it 'should fail' do
        expect { result }.to raise_error(SpaceTravelCalculator::UnpermittedGravityError, /Unpermitted gravity/)
      end
    end

    context 'when input data is valid' do
      let(:equipment_weight) { 28_801 }
      let(:travels) { [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 9.807]] }

      it 'should not fail' do
        expect { result }.not_to raise_error
      end

      it 'should return a result' do
        expect(result).to be_eql(51_898)
      end
    end
  end
end
