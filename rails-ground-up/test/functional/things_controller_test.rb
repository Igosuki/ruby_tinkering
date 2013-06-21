require 'test_helper'
class ThingsControllerTest < ActionController::TestCase
  setup do
    @thing = things(:first)
  end

  test "should get index" do 
  	get :index
  	assert_response :success
  	assert_not_nil assigns(:things)
  end

  test "should create thing" do
    assert_difference('Thing.count') do
      post :create, :thing => {:name => @thing.name}
    end
  	assert_redirected_to thing_path(assigns(:thing))
  end
end