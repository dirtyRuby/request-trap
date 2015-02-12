require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @correct_user_attribute = "Coreect1"
    @incorrect_user_attribute = "incorrect"
    @incorrect_user_name_set = %w(u*ser1R #user1R @user1R ?user1R !user1R)
    @incorrect_password_set = %w(*password1R #password1R @password1R ?password1R !password1R)
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

  test "user name andpassword must contain only numbers and letters" do
    assert create_user(@correct_user_attribute, @correct_user_attribute).valid?
  end

  test "user name must not contain non alphanumeric chars" do
    @incorrect_user_name_set.each do |user_name|
      assert create_user(user_name, @correct_user_attribute).invalid?
    end
  end

  test "user name must contain at least one upper case letter, one lower case letter" do
    assert create_user(@incorrect_user_attribute, @correct_user_attribute).invalid?
    assert create_user(@correct_user_attribute, @correct_user_attribute).valid?
  end

  test "password must contain at least one upper case letter, one lower case letter" do
    assert create_user(@correct_user_attribute, @incorrect_user_attribute).invalid?
    assert create_user(@correct_user_attribute, @correct_user_attribute).valid?
  end

  test "password must not contain non alphanumeric chars" do
    @incorrect_password_set.each do |password|
      assert create_user(password, @correct_user_attribute).invalid?
    end
  end

  private
  def create_user user_name, password
    User.new(user_name: user_name, password: password)
  end
end
