require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @correct_user_name = "Coreect1"
    @correct_password = "Correct1"
    @incorrect_user_name_set = ['u*ser1R', '#user1R', '@user1R', '?user1R', '!user1R']
    @incorrect_password_set = ['*password1R', '#password1R', '@password1R', '?password1R', '!password1R']
  end

  test "should not duplicate users" do
    user = User.new(user_name: "Admin1", password: "Admin1")
    assert user.invalid?
  end

  test "user attributes must not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:user_name].any?
    assert user.errors[:password].any?
  end



  test "user name must contain only numbers and letters" do
    assert create_user(@correct_user_name, @correct_password).valid?
  end

  test "user name must not contain non alphanumeric chars" do
    @incorrect_user_name_set.each do |user_name|
      assert create_user(user_name, @correct_password).invalid?
    end
  end

  test "user name must contain at least one upper case letter, one lower case letter, one number" do

  end

  test "password must contain only numbers and letters" do

  end

  test "password name must contain at least one upper case letter, one lower case letter, one number" do

  end

  private
  def create_user user_name, password
    User.new(user_name: user_name, password: password)
  end
end
