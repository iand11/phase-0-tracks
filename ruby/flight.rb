module Flight
	def take_off(altitude)
		puts "Taking off and accending until reaching #{altitude} ... "
	end
end

class Bird
	include Flight
end

class Plane
	include Flight
end