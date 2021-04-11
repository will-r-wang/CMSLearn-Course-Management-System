require "test_helper"

class CourseTest < ActiveSupport::TestCase
  
  test "create a new course" do
    teacher = Teacher.create!(password: "test")
    semester = Semester.create!
    course = Course.new(teacher: teacher, semester: semester)
    assert course.save
  end

end
