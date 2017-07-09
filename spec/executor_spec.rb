require 'spec_helper'

RSpec.describe Executor do
  let(:robot) { Robot.new }
  subject { described_class.new(robot) }

  describe '#command' do
    it 'expects to ignore incorrect commands' do
      expect(subject.command('xyz')).to be_nil
    end

    context 'execute correct commands' do
      it 'expects to place the robot' do
        expect(robot).to receive(:place).with(1, 1, 'NORTH')
        subject.command('PLACE 1,1,NORTH')
      end

      %w(move left right).each do |method|
        it "expects to #{method} the robot" do
          expect(robot).to receive(method)
          subject.command(method)
        end
      end
    end
  end
end
