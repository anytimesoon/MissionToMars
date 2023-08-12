# frozen_string_literal: true

class MarsMap
  attr_reader :x_max, :y_max

  def initialize(x_max, y_max)
    @x_max=(x_max)
    @y_max=(y_max)
  end

  private
  def x_max=(x_max)
    @x_max = x_max
  end

  def y_max=(y_max)
    @y_max = y_max
  end
end

