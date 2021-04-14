class UserMailer < ApplicationMailer
  default from: "system@cmslearn.com"

  def announcement_notification_email(user, announcement)
    @announcement = announcement
    mail(to: user.email, subject: 'CMSLearn Announcement Email')
  end
end
