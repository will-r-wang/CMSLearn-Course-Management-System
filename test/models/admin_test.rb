require "test_helper"

class AdminTest < ActiveSupport::TestCase
  test "create an admin" do
    admin = Admin.new(first_name: "test", last_name: "test", username: "test", password: "test")
    assert admin.save
  end

  test "should not create admin without password" do
    admin = Admin.new(first_name: "test", last_name: "test", username: "test")
    assert_not admin.save
  end
end
