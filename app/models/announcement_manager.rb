class AnnouncementManager < ApplicationRecord
  belongs_to :course
  has_many :subscriptions, dependent: :delete_all
  has_many :announcements

  def subscribe(student_id)
    Subscription.new(student_id: student_id, announcement_manager_id: @id)
  end

  def notify(announcement)
    subscriptions.each do |subscription|
      UserMailer.announcement_notification_email(current_user, announcement)
    end
  end

  def unsubscribe(student_id)
    subscriptions.find_by(student_id: student_id).destroy
  end
end
