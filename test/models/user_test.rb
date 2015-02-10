require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should not duplicate users" do
    user = User.new(user_name: "admin", password: "admin")
    assert user.invalid?
  end

  test "user attributes must not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:user_name].any?
    assert user.errors[:password].any?
  end

end
