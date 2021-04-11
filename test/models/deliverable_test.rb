require "test_helper"

class DeliverableTest < ActiveSupport::TestCase
  
  test "create a new deliverable" do
    teacher = Teacher.create!(password: "test")
    semester = Semester.create!
    course = Course.create!(teacher: teacher, semester: semester)
    deliverable = Deliverable.new(course: course)
    assert deliverable.save
  end

end
