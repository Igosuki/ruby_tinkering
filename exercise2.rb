
Hash.send(:define_method, :squared_euclidian_distance) do |hash| 
	(self[:x].to_i - hash[:x].to_i)**2 + (self[:y].to_i - hash[:y].to_i)**2
end

puts ({}.squared_euclidian_distance({}))
puts ({:x => 2, :y => 3}.squared_euclidian_distance({:x => 5, :y => 4}))
puts ({}.squared_euclidian_distance({:x => 10, :y => 20}))
puts ({:x => 10, :y => 20}.squared_euclidian_distance({}))