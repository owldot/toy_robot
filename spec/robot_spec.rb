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
    context 'valid placement' do
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

    context 'invalid placement' do
      it 'ignores move' do
        subject.place(x: 0, y: 5, face: 'WEST')
        subject.move
        expect(subject.report).to eq nil
      end
    end
  end

  describe '#left' do
    it 'turns from EAST to NORTH' do
      subject.place(x: 0, y: 0, face: 'EAST')
      subject.left
      expect(subject.report).to eq '0, 0, NORTH'
    end

    it 'turns from NORTH to WEST' do
      subject.place(x: 0, y: 0, face: 'NORTH')
      subject.left
      expect(subject.report).to eq '0, 0, WEST'
    end

    it 'turns from WEST to SOUTH' do
      subject.place(x: 0, y: 0, face: 'WEST')
      subject.left
      expect(subject.report).to eq '0, 0, SOUTH'
    end

    it 'turns from SOUTH to EAST' do
      subject.place(x: 0, y: 0, face: 'SOUTH')
      subject.left
      expect(subject.report).to eq '0, 0, EAST'
    end
  end

  describe '#right' do
    it 'turns from EAST to SOUTH' do
      subject.place(x: 0, y: 0, face: 'EAST')
      subject.right
      expect(subject.report).to eq '0, 0, SOUTH'
    end

    it 'turns from SOUTH to WEST' do
      subject.place(x: 0, y: 0, face: 'SOUTH')
      subject.right
      expect(subject.report).to eq '0, 0, WEST'
    end

    it 'turns from WEST to NORTH' do
      subject.place(x: 0, y: 0, face: 'WEST')
      subject.right
      expect(subject.report).to eq '0, 0, NORTH'
    end

    it 'turns from NORTH to EAST' do
      subject.place(x: 0, y: 0, face: 'NORTH')
      subject.right
      expect(subject.report).to eq '0, 0, EAST'
    end
  end
end
