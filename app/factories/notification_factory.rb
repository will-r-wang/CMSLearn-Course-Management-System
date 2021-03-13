# [Design Pattern] Factory Pattern
class NotificationFactory
  def self.create_notification(notification_type)
    case notification_type
    when 'email'
      EmailNotification.new
    when 'web'
      WebNotification.new
    when 'text'
      TextNotification.new
    else
      raise NotImplementedError # raises an exception since Notification class is abstract
    end
  end
end
