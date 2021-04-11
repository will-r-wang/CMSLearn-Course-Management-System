require "test_helper"

class EmailNotificationTest < ActiveSupport::TestCase

  test "create a new email notification" do
    teacher = Teacher.create!(username: "test", password: "test")
    semester = Semester.create!
    course = Course.create!(teacher: teacher, semester: semester)
    student = Student.create!(username: "test0", password: "test")
    email_notification = EmailNotification.new(student: student, course: course)
    assert email_notification.save
  end

end
