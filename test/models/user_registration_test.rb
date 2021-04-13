require "test_helper"

class UserRegistrationTest < ActiveSupport::TestCase
  test "create a new user registration" do
    user = User.create!(username: "test", password: "test")
    user_registration = UserRegistration.new(status: "pending", user_type: "student", user: user)
    assert user_registration.save
  end
end
