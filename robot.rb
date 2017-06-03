require "rubygems"
require "bundler/setup"

class Robot
  FACE = { NORTH: 'NORTH', SOUTH: 'SOUTH', EAST: 'EAST', WEST: 'WEST' }.freeze
  DIMENSION = 5
  attr_reader :x, :y, :face

  def initialize(x:, y:, face:)
    @x = x
    @y = y
    @face = face
  end

  def report
    { x: x, y: y, face: face }
  end
end
