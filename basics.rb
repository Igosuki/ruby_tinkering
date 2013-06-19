puts "Ruby Basics"

puts "Hello"
friend = "Guillaume"
helloworld = "Hello World #{friend}"
puts helloworld #Hello World
puts "#{helloworld}".downcase!
puts helloworld	
puts helloworld.class

puts "Regexps"
puts "Hello World" =~ /World/

puts "Multiline Strings"
s = %q|
	Some 
	Multiline
	String 
	|
puts s	
s2 = <<-EOS
	Line 1
	Line 2
EOS
puts s2

puts "For loop"
for i in 1..5 
	puts i 
end

puts "Times"
5.times { i
	puts i 
}

puts "Times and Unless"
10.times { |i|
	puts i unless i.even?
}

puts "Container"
["rouge", 1, (1..5)].each do |i|
	puts "#{i} is #{i.class}"
end

puts "Compact"
[1, nil, 2, 3].compact
puts "Flatten"
[[1, nil], [2], [3, 4]].flatten

puts "Case"
[1, 7, 'A', 2, 'Z'].each do |i| 
	case 
	when i.is_a?(String) then puts "letter"	
	when i%2 == 1 then puts "odd number"
	when i%2 == 0 then puts "even number"
	else puts "i is something else"
	end
end

puts "Hashes"
hash = {
	:red => {:french => "rouge", :english => "red"}
}

puts hash

puts "Mapping"
puts ["red", "yellow"].map {|i| i.upcase}
puts "Injecting"
puts ["red", "yellow", "black"].inject() {|i, j| i << j}

puts "Tapping"
1.tap {|i| puts i }.tap {|i| puts i * 2}

puts "Square : 3^2 = #{3**2}"
puts "Pushing values : "
puts [1,2].push 3
puts [1,2] << 3

puts "Or Statement"
puts nil || "empty"
puts false || "value"
x ||= "Value for X if nil"
puts x