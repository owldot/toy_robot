require "./robot"

RSpec.describe Robot do
  context 'valid input' do
    it 'expects initialize object' do
      expect { described_class.new(x: 0, y: 0, face: 'NORTH') }.not_to raise_error
    end
  end

  context 'invalid input' do
    it 'expects to raise error with incorrect x' do
      expect { described_class.new(x: 6, y: 0, face: 'NORTH') }.to raise_error 'Incorrect input'
    end
    it 'expects to raise error with incorrect y' do
      expect { described_class.new(x: 3, y: -1, face: 'NORTH') }.to raise_error 'Incorrect input'
    end
    it 'expects to raise error with incorrect face' do
      expect { described_class.new(x: 6, y: 0, face: 'SOMEWHERE') }.to raise_error 'Incorrect input'
    end
  end

  describe '#print' do
    subject { described_class.new(x: 1, y: 2, face: 'SOUTH') }
    it 'prints position' do
      expect(subject.report).to eq('1, 2, SOUTH')
    end
  end
end
