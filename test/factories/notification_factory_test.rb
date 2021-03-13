require "test_helper"

class NotificationFactoryTest < ActiveSupport::TestCase
  test "create_notification returns an EmailNotification when the type is email" do
    assert NotificationFactory.create_notification('email').instance_of?(EmailNotification)
  end

  test "create_notification returns a WebNotification when the type is web" do
    assert NotificationFactory.create_notification('web').instance_of?(WebNotification)
  end

  test "create_notification returns a TextNotification when the type is text" do
    assert NotificationFactory.create_notification('text').instance_of?(TextNotification)
  end

  test "create_notification raises NotImplementedError when the type is not valid type" do
    assert_raises NotImplementedError do
      NotificationFactory.create_notification('foo')
    end
  end
end

