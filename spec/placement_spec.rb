require "./robot"

RSpec.describe Placement do
  context 'valid input' do
    it 'expects initialize object' do
      expect { described_class.new(x: 0, y: 0, face: 'NORTH') }.not_to raise_error InvalidPlacement
    end
  end

  context 'invalid input' do
    it 'expects to raise error with incorrect x' do
      expect { described_class.new(x: 6, y: 0, face: 'NORTH') }.to raise_error InvalidPlacement
    end
    it 'expects to raise error with incorrect y' do
      expect { described_class.new(x: 3, y: -1, face: 'NORTH') }.to raise_error InvalidPlacement
    end
    it 'expects to raise error with incorrect face' do
      expect { described_class.new(x: 6, y: 0, face: 'SOMEWHERE') }.to raise_error InvalidPlacement
    end
  end

  describe '#print' do
    subject { described_class.new(x: 1, y: 2, face: 'SOUTH') }
    it 'prints position' do
      expect(subject.print).to eq('1, 2, SOUTH')
    end
  end

  describe '#==' do
      let(:other_placement) { Placement.new(x: 1, y: 2, face: 'NORTH') }
    it 'equals' do
      expect(described_class.new(x: 1, y: 2, face: 'NORTH')).to eq other_placement
    end

    it 'not equals' do
      expect(described_class.new(x: 3, y: 4, face: 'SOUTH')).not_to eq other_placement
    end
  end
end
