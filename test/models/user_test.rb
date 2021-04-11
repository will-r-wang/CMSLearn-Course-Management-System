require "test_helper"

class UserTest < ActiveSupport::TestCase

  test "create a new user" do
    user = User.new(password: "test")
    assert user.save
  end
  
end
