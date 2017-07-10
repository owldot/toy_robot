class Executor

  def initialize(robot = Robot.new)
    @robot = robot
  end

  def command(str)
    command_line = str.split(' ')
    command = command_line[0].downcase.to_sym
    args = extract_args(command_line[1])
    return nil unless robot.methods.include? command

    print_out(robot.public_send(command, *args))
  end

  private

  attr_reader :robot

  def extract_args(args)
    return if args.nil?

    args.split(',').map do |arg|
      begin
        Integer(arg)
      rescue ArgumentError
        arg
      end
    end
  end

  def print_out(result)
    if result.is_a? String
      puts result
    end

    result
  end
end
