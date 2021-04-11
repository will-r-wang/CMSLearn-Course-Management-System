require "test_helper"

class CoursesControllerTest < ActionDispatch::IntegrationTest

  test "creates a new course" do
    post '/courses', params: { course: {course_name: "test", course_code: "999", capacity: "1" }}
    assert_response :redirect
    assert_redirected_to '/courses/new'
  end
  
end
