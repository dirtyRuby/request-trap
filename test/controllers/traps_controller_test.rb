require 'test_helper'

class TrapsControllerTest < ActionController::TestCase
  setup do
    session[:user_id] = users(:admin).id
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
