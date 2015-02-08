class Plane

	def initialize
		@flying = true
	end

	def flying?
		@flying
	end

	def in_the_air!
		@flying = true
		self
	end

	def landed!
		@flying = false
		self
	end

	def take_off!
		@flying = true
		self
	end

end