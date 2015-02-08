class Airport

	DEFAULT_CAPACITY = 2

	attr_reader :planes
	attr_reader :capacity

	 def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
	  @planes ||= []
	end

	def land(plane)
		raise "Airport is full" if full?
		planes << plane
    # self
	end

	def take_off(plane)
		planes.delete(plane)
	end

	def planes_count
		planes.count
	end

	def full?
		planes_count == capacity
	end
end
