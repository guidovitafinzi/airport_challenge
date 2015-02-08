require_relative 'weather'

class Airport

  include Weather

	DEFAULT_CAPACITY = 20

	attr_reader :planes
	attr_reader :capacity

	def initialize(options = {})
	 	@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
	 	@planes ||= []
	end

	def land(plane)
		raise "Airport is full" if full?
		planes << plane
    # raise "Land permission denied" if weather_rand == 'stormy'
	end

	def take_off(plane)
		planes.delete(plane)
    raise "Take off permission denied" if weather_rand == 'stormy'
	end

	def planes_count
		planes.count
	end

	def full?
		planes_count == capacity
	end
end
