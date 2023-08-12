require_relative './models/mars_map'
require_relative './models/mission_control'
require_relative './models/rover'

def start_mission(map_coordinates, rovers_objectives)
  map = MarsMap.new(map_coordinates[0], map_coordinates[1])
  mission_control = MissionControl.new
  rovers_objectives.each do |rover_with_objectives|
    uninitialized_rover = rover_with_objectives[:rover]
    objectives = rover_with_objectives[:objectives]
    rover = Rover.new(uninitialized_rover[:x_coord],
                      uninitialized_rover[:y_coord],
                      uninitialized_rover[:orientation],
                      map)

    mission_control.send_objectives(rover, objectives)
    puts "#{rover.x_coord} #{rover.y_coord} #{rover.orientation}"
  end
end

map_coordinates = [5, 5]

# Assumption is made that the input would be a JSON object represented here by a hash
rovers_with_objectives = [
  {
    rover: {
      x_coord: 1,
      y_coord: 2,
      orientation: "N"
    },
    objectives: "LMLMLMLMM"
  },
  {
    rover: {
      x_coord: 3,
      y_coord: 3,
      orientation: "E"
    },
    objectives: "MMRMMRMRRM"
  }
]

start_mission(map_coordinates, rovers_with_objectives)