require "test_helper"

class CourseRegistrationTest < ActiveSupport::TestCase

  test "create a new course registration" do
    teacher = Teacher.create!(password: "test")
    semester = Semester.create!
    course = Course.create!(teacher: teacher, semester: semester)
    user = User.create!(username: "test", password: "test")
    course_registration = CourseRegistration.new(user: user, course: course)
    assert course_registration.save
  end

end
