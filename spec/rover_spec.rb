# frozen_string_literal: true
require 'spec_helper'
require 'rspec'
require_relative '../models/rover'
require_relative '../models/mars_map'

describe Rover do
  describe "#move" do
    it "moves the rover in the correct orientation" do
      map = MarsMap.new(5, 5)
      rover = Rover.new(3, 1, "N", map)
      rover.move
      expect(rover).to have_attributes(x_coord: 3, y_coord: 2)
    end

    it "stays within the bounds of the map" do
      map = MarsMap.new(5, 5)
      rover = Rover.new(0, 3, "W", map)
      rover.move
      expect(rover).to have_attributes(x_coord: 0, y_coord: 3)
    end
  end

  describe "#turn" do
    it "turns the orientation left" do
      map = MarsMap.new(5, 5)
      rover = Rover.new(3, 1, "N", map)
      rover.turn("L")
      expect(rover).to have_attributes(orientation: "W")
    end
    it "turns the orientation right" do
      map = MarsMap.new(5, 5)
      rover = Rover.new(3, 1, "W", map)
      rover.turn("R")
      expect(rover).to have_attributes(orientation: "N")
    end
  end
end