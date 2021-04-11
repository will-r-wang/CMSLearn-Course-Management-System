require "test_helper"

class StudentTest < ActiveSupport::TestCase

  test "create a new student" do
    student = Student.new(password: "test")
    assert student.save
  end

end
