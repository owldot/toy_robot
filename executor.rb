class Executor

  def initialize(robot = Robot.new)
    @robot = robot
  end

  def command(command, *args)
    return nil unless robot.methods.include? command

    robot.public_send(command, *args)
  end

  private

  attr_reader :robot
end
