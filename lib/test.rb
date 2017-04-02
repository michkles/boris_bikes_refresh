require_relative './lib/bike'
require_relative './lib/docking_station'
red = Bike.new
green = Bike.new
blue = Bike.new
blue.report_broken
manchester = DockingStation.new
manchester.dock(red)
manchester.dock(green)
manchester.dock(blue)
manchester.release_bike
manchester
