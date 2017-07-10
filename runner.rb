class Runner

  def initialize(source:, executor: Executor.new)
    @executor = executor
    @commands = source
  end

  def execute
    commands.each do |command|
      executor.command(command)
    end
  end

  private

  attr_reader :executor, :commands
end
