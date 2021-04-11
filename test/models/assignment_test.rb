require "test_helper"

class AssignmentTest < ActiveSupport::TestCase

  test "create a new assignment" do
    teacher = Teacher.create!(password: "test")
    semester = Semester.create!
    course = Course.create!(teacher: teacher, semester: semester)
    assignment = Assignment.new(course: course)
    assert assignment.save
  end

end
