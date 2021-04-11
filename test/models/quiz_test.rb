require "test_helper"

class QuizTest < ActiveSupport::TestCase
  
  test "create a new quiz" do
    teacher = Teacher.create!(password: "test")
    semester = Semester.create!
    course = Course.create!(teacher: teacher, semester: semester)
    quiz = Quiz.new(course: course)
    assert quiz.save
  end

end
