require 'test_helper'
 
class ThingFlowsTest < ActionDispatch::IntegrationTest
  fixtures :all
  setup do 

  end
  # Replace this with your real tests.
  test "complete scenario" do
    post_via_redirect "/things", :thing => {:name => "Alex", :description => "Intg test"}
    assert_equal "/things/3", path
    put_via_redirect(thing_path({:id => 3, :name => "A new name"}))
    assert_equal "/things/3", path
    delete(thing_path(3))
    get(thing_path(3))
    assert_response 404
  end
end