# frozen_string_literal: true

class Rover
  attr_reader :directions
  attr_accessor :x_coord, :y_coord, :orientation, :map

  @directions = %w[N E S W]

  def initialize(x, y, orientation, map)
    @x_coord = x
    @y_coord = y
    @orientation = orientation
    @map = map
  end

  def move
    case @orientation
    when "N"
      y = @y_coord + 1
      if valid_move?(@x_coord, y)
        @y_coord = y
      end
    when "E"
      x = @x_coord + 1
      if valid_move?(x, @y_coord)
        @x_coord = x
      end
    when "S"
      y = @y_coord - 1
      if valid_move?(@x_coord, y)
        @y_coord = y
      end
    when "W"
      x = @x_coord - 1
      if valid_move?(x, @y_coord)
        @x_coord = x
      end
    else
      puts "you can't leave the boundary of the map"
    end
  end

  private
  def valid_move?(x, y)
    if x == -1 || x > @map.x_max || y == -1 || y > @map.y_max
      return false
    end

    true
  end
end
