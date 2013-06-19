
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
		@x -= i
		@y -= i
		[x, y]
	end

	def +(i)
		@x += i
		@y += i
		[x, y]
	end
end

