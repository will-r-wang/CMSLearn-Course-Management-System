require "test_helper"

class TeacherTest < ActiveSupport::TestCase

  test "create a new teacher" do
    teacher = Teacher.new(password: "test")
    assert teacher.save
  end

end
