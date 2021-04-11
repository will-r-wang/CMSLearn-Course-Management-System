require "test_helper"

class BackgroundSurveyTest < ActiveSupport::TestCase

  test "create a new background survey" do
    teacher = Teacher.create!(password: "test")
    semester = Semester.create!
    course = Course.create!(teacher: teacher, semester: semester)
    background_survey = BackgroundSurvey.new(course: course)
    assert background_survey.save
  end

end
