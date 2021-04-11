require "test_helper"

class NotificationTest < ActiveSupport::TestCase
  
  test "create a new notification" do
    teacher = Teacher.create!(username: "test", password: "test")
    semester = Semester.create!
    course = Course.create!(teacher: teacher, semester: semester)
    student = Student.create!(username: "test0", password: "test")
    notification = Notification.new(student: student, course: course)
    assert notification.save
  end
end
