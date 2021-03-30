require "test_helper"

class SubscriptionTest < ActiveSupport::TestCase
  test "initialize creates a subscription with student_id and announcement_manager_id" do
    student = Student.create(password: 'test')
    announcement_manager = AnnouncementManager.create
    assert_difference 'Subscription.count', 1 do
      Subscription.create(student_id: student.id, announcement_manager_id: announcement_manager.id)
    end
  end
end
