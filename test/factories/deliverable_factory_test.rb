require "test_helper"

class DeliverableFactoryTest < ActiveSupport::TestCase
  test "create_deliverable returns a Tutorial when the type is tutorial" do
    assert DeliverableFactory.create_deliverable('tutorial').instance_of?(Tutorial)
  end

  test "create_deliverable returns a Quiz when the type is quiz" do
    assert DeliverableFactory.create_deliverable('quiz').instance_of?(Quiz)
  end

  test "create_deliverable returns an Assignment when the type is assignment" do
    assert DeliverableFactory.create_deliverable('assignment').instance_of?(Assignment)
  end

  test "create_deliverable returns a BackgroundSurvey when the type is survey" do
    assert DeliverableFactory.create_deliverable('survey').instance_of?(BackgroundSurvey)
  end

  test "create_deliverable raises NotImplementedError when the type is not valid type" do
    assert_raises NotImplementedError do
      DeliverableFactory.create_deliverable('foo')
    end
  end
end
