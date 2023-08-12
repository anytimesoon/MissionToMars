# frozen_string_literal: true

require 'rspec'
require_relative '../models/mission_control'
require_relative '../models/rover'
require_relative '../models/mars_map'

describe MissionControl do
  describe "#send_objectives" do
    it "sends objectives to a rover" do
      map = MarsMap.new(5,5)
      rover = Rover.new(1, 2, "N", map)
      movements = "LMLMLMLMM"
      mission_control = MissionControl.new(rover, movements)
      mission_control.send_objectives
      expect(rover).to have_attributes(x_coord: 1, y_coord: 3, orientation: "N")
    end
    it "sends objectives to another rover" do
      map = MarsMap.new(5,5)
      rover = Rover.new(3, 3, "E", map)
      movements = "MMRMMRMRRM"
      mission_control = MissionControl.new(rover, movements)
      mission_control.send_objectives
      expect(rover).to have_attributes(x_coord: 5, y_coord: 1, orientation: "E")
    end
  end
end
