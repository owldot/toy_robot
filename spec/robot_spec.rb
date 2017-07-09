require 'spec_helper'

RSpec.describe Robot do
  subject { described_class.new }

  describe '#place' do
    let(:placement) {Placement.new(x: 1, y: 2, face: 'SOUTH')}

    it 'places the robot' do
      expect(subject.place(1, 2, 'SOUTH')).to eq(placement)
    end
  end

  describe '#report' do
    it 'reports position' do
      subject.place(1,  2, 'SOUTH')
      expect(subject.report).to eq('1, 2, SOUTH')
    end
  end

  describe '#move' do
    context 'valid placement' do
      it 'moves to SOUTH' do
        subject.place(1, 2, 'SOUTH')
        subject.move
        expect(subject.report).to eq '1, 1, SOUTH'
      end

      it 'moves to NORTH' do
        subject.place(1, 2, 'NORTH')
        subject.move
        expect(subject.report).to eq '1, 3, NORTH'
      end

      it 'moves to EAST' do
        subject.place(1, 2, 'EAST')
        subject.move
        expect(subject.report).to eq '2, 2, EAST'
      end

      it 'moves to WEST' do
        subject.place(1, 2, 'WEST')
        subject.move
        expect(subject.report).to eq '0, 2, WEST'
      end
    end

    context 'invalid placement' do
      it 'ignores move' do
        subject.place(0, 5, 'WEST')
        subject.move
        expect(subject.report).to eq nil
      end
    end
  end

  describe '#left' do
    it 'turns from EAST to NORTH' do
      subject.place(0, 0, 'EAST')
      subject.left
      expect(subject.report).to eq '0, 0, NORTH'
    end

    it 'turns from NORTH to WEST' do
      subject.place(0, 0, 'NORTH')
      subject.left
      expect(subject.report).to eq '0, 0, WEST'
    end

    it 'turns from WEST to SOUTH' do
      subject.place(0, 0, 'WEST')
      subject.left
      expect(subject.report).to eq '0, 0, SOUTH'
    end

    it 'turns from SOUTH to EAST' do
      subject.place(0, 0, 'SOUTH')
      subject.left
      expect(subject.report).to eq '0, 0, EAST'
    end
  end

  describe '#right' do
    it 'turns from EAST to SOUTH' do
      subject.place(0, 0, 'EAST')
      subject.right
      expect(subject.report).to eq '0, 0, SOUTH'
    end

    it 'turns from SOUTH to WEST' do
      subject.place(0, 0, 'SOUTH')
      subject.right
      expect(subject.report).to eq '0, 0, WEST'
    end

    it 'turns from WEST to NORTH' do
      subject.place(0, 0, 'WEST')
      subject.right
      expect(subject.report).to eq '0, 0, NORTH'
    end

    it 'turns from NORTH to EAST' do
      subject.place(0, 0, 'NORTH')
      subject.right
      expect(subject.report).to eq '0, 0, EAST'
    end
  end
end
