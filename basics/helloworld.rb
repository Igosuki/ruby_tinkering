#require './basics.rb'

require './oop.rb'

puts Color.new.inspect
red = Color.new("red")
puts red.inspect
puts red.just_raise_it
puts Color.new.just_raise_it
puts Color.new("green").raise_and_retry 
puts Color.new.is_a?(Color)

require './mixins.rb'

puts Point2D.new(5).decrement
puts Point2D.new(5).increment
puts Point2D.new(4) - Point2D.new(5)

require './exercise2.rb'



