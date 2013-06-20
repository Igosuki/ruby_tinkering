
module Incrementable
	def increment
		self + 1
	end
end

module Decrementable 
	def decrement
		self - 1
	end
end

class Point2D 
	include Incrementable
	include Decrementable

	attr_reader :x, :y

	def initialize(value=nil) 
		@x = value
		@y = value
	end

	def -(i)
		if(i.is_a?(Numeric))
			@x -= i
			@y -= i
		elsif(i.is_a?(Point2D))
			@x -= i.x
			@y -= i.y
		else raise "I don't know how to substract this from a 2D Point"
		end
		self
	end

	def +(i)
		if(i.is_a?(Numeric))
			@x += i
			@y += i
		elsif(i.is_a?(Point2D))
			@x += i.x
			@y += i.y
		else raise "I don't know how to add this to a 2D Point"
		end
		self
	end

	def to_s
		"(#{x}, #{y})"
	end
end

