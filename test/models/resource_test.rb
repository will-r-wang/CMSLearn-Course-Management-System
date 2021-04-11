require "test_helper"

class ResourceTest < ActiveSupport::TestCase

  test "create a new resource" do
    teacher = Teacher.create!(password: "test")
    semester = Semester.create!
    course = Course.create!(teacher_id: teacher.id, semester_id: semester.id)
    resource = Resource.new(course: course)
    assert resource.save
  end

end
