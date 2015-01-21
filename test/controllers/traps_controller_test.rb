require 'test_helper'

class TrapsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get capture" do
    get :capture
    assert_response :success
  end

end
