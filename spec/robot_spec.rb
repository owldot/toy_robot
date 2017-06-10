require "./robot"

RSpec.describe Robot do
  subject { described_class.new }

  describe '#place' do
    let(:placement) { Placement.new(x:1, y: 2, face: 'SOUTH')}

    it 'places the robot' do
      expect(subject.place(x:1, y: 2, face: 'SOUTH')).to eq(placement)
    end
  end

  describe '#report' do
    it 'reports position' do
      subject.place(x: 1, y: 2, face: 'SOUTH')
      expect(subject.report).to eq('1, 2, SOUTH')
    end
  end

  describe '#move' do
    it 'moves to SOUTH' do
      subject.place(x: 1, y: 2, face: 'SOUTH')
      subject.move
      expect(subject.report).to eq '1, 1, SOUTH'
    end

    it 'moves to NORTH' do
      subject.place(x: 1, y: 2, face: 'NORTH')
      subject.move
      expect(subject.report).to eq '1, 3, NORTH'
    end

    it 'moves to EAST' do
      subject.place(x: 1, y: 2, face: 'EAST')
      subject.move
      expect(subject.report).to eq '2, 2, EAST'
    end

    it 'moves to WEST' do
      subject.place(x: 1, y: 2, face: 'WEST')
      subject.move
      expect(subject.report).to eq '0, 2, WEST'
    end
  end
end
