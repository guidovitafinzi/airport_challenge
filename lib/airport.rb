require_relative 'weather'

class Airport

  include Weather

  DEFAULT_CAPACITY = 102

  attr_reader :capacity

  def initialize(specs = {})
    @capacity = specs.fetch(:capacity, DEFAULT_CAPACITY)
    @planes   = []
  end

  def land(plane)
    raise "Land permission denied" if stormy_weather? == true
    raise "Airport is full" if full?
    @planes << plane.land!
  end

  def take_off(plane)
    raise "Take off permission denied" if stormy_weather? ==true
    @planes.delete(plane.land!)
    plane.take_off!
  end

  def planes_count
    @planes.count
  end

  def full?
    planes_count == capacity
  end

end

