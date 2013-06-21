require 'test_helper'

class ThingTest < ActiveSupport::TestCase
	test "new thing" do 
		assert Thing.new
	end

	test "create a thing" do 
		assert Thing.new(:id => 3, :name => "dat").save
	end	

	test "destroy a thing" do 
		assert Thing.find(1).destroy
	end	

	test "find a thing" do 
		assert Thing.find(1).name == "Guillaume"
	end	

	test "update a thing" do 
		thing = Thing.find(2)
		assert thing.update_attributes({:description => "another description", :name => "a new name"})
	end	
end
