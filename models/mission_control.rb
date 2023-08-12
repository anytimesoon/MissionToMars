# frozen_string_literal: true

class MissionControl
  attr_accessor :rover, :movements
  def initialize(rover, movements)
    @rover = rover
    @movements = movements
  end

  def send_objectives
    objectives = movements.split("")
    objectives.each do |objective|
      case objective
      when "M"
        @rover.move
      when "L", "R"
        @rover.turn(objective)
      else
        puts "unrecognised objective"
      end
    end
  end
end
