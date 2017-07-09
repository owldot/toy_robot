class FileInput

  def initialize(file:, executor: Executor.new)
    @executor = executor
    @file = file
    @commands = commands_from
  end

  def execute
    commands.each do |command|
      executor.command(command)
    end
  end

  private

  attr_reader :executor, :commands, :file

  def commands_from
    File.readlines(file)
  end
end
