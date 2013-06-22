require 'spec_helper'

describe ThingsController do
	
	describe "GET index" do 
		let(:mock_thing) { mock_model(Thing).as_null_object }
		it "assigns all things to @things" do
			Thing.stub!(:all).and_return [mock_thing]
			get :index
			assigns(:things).should eq [mock_thing]
		end
	end	

	describe "GET edit" do 
		it "assigns the thing to @thing" do
			Thing.should_receive(:find).with("2").once
			get :edit, id: 2
		end
	end
end
