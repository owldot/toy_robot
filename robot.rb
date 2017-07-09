require 'rubygems'
require 'bundler/setup'
require_relative 'placement'

class Robot
  DIMENSION = 5

  def place(x, y, face)
    @placement = Placement.new(x: x, y: y, face: face)
  rescue InvalidPlacement
    # robot ignores invalid move
  end

  def report
    placement.print unless placement.nil?
  end

  def move
    return if placement.nil?

    new_placement = placement
    case placement.face
      when Placement::FACE[:SOUTH]
        new_placement = Placement.new(x: placement.x, y: placement.y - 1, face: placement.face)
      when Placement::FACE[:NORTH]
        new_placement = Placement.new(x: placement.x, y: placement.y + 1, face: placement.face)
      when Placement::FACE[:EAST]
        new_placement = Placement.new(x: placement.x + 1, y: placement.y, face: placement.face)
      when Placement::FACE[:WEST]
        new_placement = Placement.new(x: placement.x - 1, y: placement.y, face: placement.face)
    end

    @placement = new_placement if new_placement.valid?
  rescue InvalidPlacement
    # robot ignores invalid move
  end

  def left
    return if placement.nil?

    turn(:left)
  end

  def right
    return if placement.nil?

    turn(:right)
  end

  private

  attr_reader :placement

  def turn(side)
    new_placement = Placement.new(x: placement.x, y: placement.y, face: Placement.turn(face: placement.face, side: side))
    @placement = new_placement if new_placement.valid?
  end
end
