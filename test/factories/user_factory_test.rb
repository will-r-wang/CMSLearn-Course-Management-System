require "test_helper"

class UserFactoryTest < ActiveSupport::TestCase
  test "create_user returns a Student when the type is student" do
    assert UserFactory.create_user('student').instance_of?(Student)
  end

  test "create_user returns a Teacher when the type is teacher" do
    assert UserFactory.create_user('teacher').instance_of?(Teacher)
  end

  test "create_user returns an Admin when the type is admin" do
    assert UserFactory.create_user('admin').instance_of?(Admin)
  end

  test "create_user raises NotImplementedError when the type is not valid type" do
    assert_raises NotImplementedError do
      UserFactory.create_user('foo')
    end
  end
end
