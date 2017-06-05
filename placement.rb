require 'pry'
class Placement
  FACE = { NORTH: 'NORTH', SOUTH: 'SOUTH', EAST: 'EAST', WEST: 'WEST' }.freeze
  DIMENSION = 5

  attr_reader :x, :y, :face

  def initialize(x:, y:, face:)
    raise 'Incorrect input' unless correct_face?(face) && correct_xy?(x, y)
    @x, @y, @face = x, y, face
  end

  def print
    "#{x}, #{y}, #{face}"
  end

  private

  def correct_face?(face)
    FACE.values.include? face
  end

  def correct_xy?(x, y)
    x >= 0 && x < DIMENSION &&
      y >=0 && y < DIMENSION
  end
end
