require "test_helper"

class AnnouncementsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get announcements_create_url
    assert_response :success
  end

  test "should get update" do
    get announcements_update_url
    assert_response :success
  end

  test "should get destroy" do
    get announcements_destroy_url
    assert_response :success
  end
end
