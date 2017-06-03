require "./robot"

RSpec.describe Robot do
  it 'expects class present' do
    expect{described_class.new(x: 0, y: 0, face: Robot::FACE[:NORTH])}.not_to raise_error
  end

  describe '#report' do
    subject { described_class.new(x:1, y: 2, face: 'SOUTH')}
    it 'reports position' do
      expect(subject.report).to eq({x: 1, y: 2, face: Robot::FACE[:SOUTH]})
    end
  end
end
