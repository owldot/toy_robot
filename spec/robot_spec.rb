require "./robot"

RSpec.describe Robot do
  describe '#report' do
    subject { described_class.new(x:1, y: 2, face: 'SOUTH')}
    it 'reports position' do
      expect(subject.report).to eq('1, 2, SOUTH')
    end
  end
end
