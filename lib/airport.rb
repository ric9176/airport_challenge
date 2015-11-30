require_relative 'planes'
require_relative 'weather'
class Airport

	attr_reader :planes

	def initialize(capacity) 
		@planes = []
		@stormy = false
		@capacity = capacity
	end
	
	def land(plane)
		fail "Cannot land plane: airport is full!" if @planes.length >= @capacity
		fail "plane cannot land in a storm" if @stormy
		fail "Plane has already landed!" if exists?(plane)
		planes << plane
		plane.landed
	end

	def takeoff(plane)
		fail "Plane cannot takeoff in a storm" if @stormy
		fail "Plane not in airport" unless exists?(plane)
		@planes.delete(plane)
		plane.flying
	end

private


	def exists?(plane)
		planes.include?(plane)
	end

	def forcast(weather)
		stormy = weather.stormy?
	end



	

end 