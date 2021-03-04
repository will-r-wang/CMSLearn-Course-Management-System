require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user factory returns a student user" do
    user = UserFactory.create_user(user_type: "student")
    assert user.instance_of?(Student)
  end

  test "user factory returns a teacher user" do
    user = UserFactory.create_user(user_type: "teacher")
    assert user.instance_of?(Teacher)
  end

  test "user factory raises when the user_type is not defined" do
    assert_raises do
      user = UserFactory.create_user(user_type: "undefined")
    end
  end
end
