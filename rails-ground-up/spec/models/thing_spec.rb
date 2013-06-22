require 'spec_helper'

describe Thing do
	it "can be created with valid name" do
		Thing.new(:name => "name").should be_valid
	end
	it "should be invalid for empty name" do
		Thing.new.should_not be_valid
	end
end