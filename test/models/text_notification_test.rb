require "test_helper"

class TextNotificationTest < ActiveSupport::TestCase

  test "create a new text notification" do
    teacher = Teacher.create!(password: "test")
    semester = Semester.create!
    course = Course.create!(teacher_id: teacher.id, semester_id: semester.id)
    student = Student.create!(username: "test", password: "test")
    text_notification = TextNotification.new(student: student, course: course)
    assert text_notification.save
  end

end
