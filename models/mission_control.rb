# frozen_string_literal: true

class MissionControl
  def send_objectives(rover, movements)
    objectives = movements.split("")
    objectives.each do |objective|
      case objective
      when "M"
        rover.move
      when "L", "R"
        rover.turn(objective)
      else
        puts "unrecognised objective"
      end
    end
  end
end
