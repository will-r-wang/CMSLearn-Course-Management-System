class AnnouncementManager < ApplicationRecord
  def subscribe(student_id)
    Subscription.new(student_id: student_id, announcement_manager_id: @id)
  end
  
  def notify
    Subscription.where(announcement_manager_id: @id).each do |subscription|
      WebNotification.new(student_id: subscription.student_id, course_id: subscription.course_id)
    end
  end

  def unsubscribe(student_id)
    Subscription.destroy(student_id: student_id, announcement_manager_id: @id)
  end
end
