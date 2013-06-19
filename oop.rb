class Color 
	def initialize(name = nil)
		@name = name
	end

	def name=(value)
		@name = value
	end

	def name 
		@name
	end

	def just_raise_it
		begin
			raise "error!" unless @name == "red"
			puts "No error !"
		rescue Exception => e 
			puts "Color wasn't red! " + e.inspect
		end 
	end

	def raise_and_retry 
		begin 
			raise "error!" unless @name == "red"	
			puts "No error !"
		rescue Exception => e 
			if @name == "green" 
				@name = "red"
				puts "Green was red, everyone makes mistakes"
				retry  
			end
		end	
	end
end
