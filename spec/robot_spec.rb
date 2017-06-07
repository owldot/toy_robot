require "./robot"

RSpec.describe Robot do
  describe '#place' do
    subject { described_class.new }
    let(:placement) { Placement.new(x:1, y: 2, face: 'SOUTH')}

    it 'places the robot' do
      expect(subject.place(x:1, y: 2, face: 'SOUTH')).to eq(placement)
    end
  end

  describe '#report' do
    subject { described_class.new }
    it 'reports position' do
      subject.place(x: 1, y: 2, face: 'SOUTH')
      expect(subject.report).to eq('1, 2, SOUTH')
    end
  end
end
