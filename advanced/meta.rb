
def collect_args(* args) 
	p "#{args}"
end

collect_args(1,2,3,4)

def invoke_a_proc(& proc) 
	yield
end

invoke_a_proc do |dunno|
	puts "Proc invoked"
end

class Something
	def initialize(thing)
	  @thing = thing
	end
	def thing=(value)
		@thing = value
	end

	def thing(& proc) 
		if block_given?
			yield @thing
		else
			@thing
		end
	end
	def call_me
		"I got called"
	end
	def method_missing(method, *args)
		p "You called #{method} with #{args}"
	end

	def self.method_missing(method, *args)
		p "You called #{method} with #{args}"
	end
end

thing = Something.new(42)
thing.thing do |thing|
	p thing * 5
end

#Proc doesn't enforce arity constraints
(Proc.new {|thing| p thing }).call 4012, 4013
#But Lambdas do
begin 
	(lambda {|thing| p thing }).call 4012, 4013
rescue ArgumentError => e
	p "Oops, lambda threw an error #{e}"
end		

p thing.send(:call_me)

#Passing a symbol as a proc invokes self.symbol
p ["hello", "world"].map(&:upcase)
#Passing a block invokes it as expected
p ["hello", "world"].map { |e| e.capitalize }

thing.unexpected_method
Something.static_unexpected_method

class Widget
	def initialize()
	  @gadgets = []
	end 
	def gadgets=(gadgets)
		@gadgets = gadgets
	end
	def add_gadget(gadget) 
		@gadgets.push(gadget)
		method(:when_added)
	end
	def remove_gadgets
		@gadgets = []
		method(:when_empty)
	end
	def when_empty 
		p "Empty Widget"
	end
	def when_added
		p "Added #{added}"
	end
end

class Gadget
	
end	

Widget.new.add_gadget(Gadget.new)