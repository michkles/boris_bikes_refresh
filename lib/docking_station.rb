require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity
  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty? || !working_bikes_any
    @bikes.delete(working_bikes_only.first)
  end

  def dock(bike)
    fail 'Station is full' if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

  def working_bikes_any
    @bikes.any? { |bike| bike.working? }
  end

  def working_bikes_only
    @bikes.select { |bike| bike.working? }
  end
end
