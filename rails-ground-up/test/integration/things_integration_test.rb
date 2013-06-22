require 'test_helper'
 
class ThingFlowsTest < ActionDispatch::IntegrationTest
  fixtures :all
  setup do 
    @id = 3
  end
  # Replace this with your real tests.
  test "complete scenario" do
    post_via_redirect "/things", :thing => {:name => "Alex", :description => "Intg test"}
    assert_equal thing_path(@id), path
    put_via_redirect(thing_path({:id => @id, :name => "A new name"}))
    assert_equal thing_path(@id), path
    delete(thing_path(@id))
    assert redirect?
    get(thing_path(@id))
    assert_response 404
  end
end