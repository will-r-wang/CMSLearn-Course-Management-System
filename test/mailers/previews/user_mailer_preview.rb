# Preview all emails at http://localhost:3000/rails/mailers/user_mailer

class UserMailerPreview < ActionMailer::Preview
  def announcement_notification_preview
    Announcement.create!(announcement_manager: AnnouncementManager.last, announcement_content: "COMP3004 Final Project is due on Friday, April 16th")
    UserMailer.announcement_notification_email(User.last, Announcement.last)
  end
end
