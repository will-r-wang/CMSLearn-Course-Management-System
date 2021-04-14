require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should redirect to login if user not logged in" do
    get root_path
    assert_response :redirect
    assert_redirected_to '/login'
  end

  test "should render student home if student logged in" do
    student = Student.create!(username: "test", password: "test")
    post '/login', params: { username: "test", password: "test" }
    assert_response :redirect
    assert_redirected_to root_path
  end

  test "should render null semester if current_semester is nil" do
    student = Student.create!(username: "test", password: "test")
    post '/login', params: { username: "test", password: "test" }
    follow_redirect!

    assert_match /9000 semester/, response.body
  end
end
