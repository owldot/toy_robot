require 'rubygems'
require 'bundler/setup'
require_relative 'placement'

class Robot
  DIMENSION = 5

  def place(x:, y:, face:)
    @placement = Placement.new(x: x, y: y, face: face)
  end

  def report
    placement.print
  end

  private

  attr_reader :placement
end
