require 'test_helper'

class RequestsControllerTest < ActionController::TestCase
  setup do
    session[:user_id] = users(:admin).id
  end

  test "should get show" do
    get :show
    assert_response :success
  end
end
