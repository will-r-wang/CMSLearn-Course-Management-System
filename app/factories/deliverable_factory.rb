# [Design Pattern] Factory Pattern
class DeliverableFactory
  def self.create_deliverable(deliverable_type)
    case deliverable_type
    when 'tutorial'
      Tutorial.new
    when 'quiz'
      Quiz.new
    when 'assignment'
      Assignment.new
    when 'survey'
      BackgroundSurvey.new
    else
      raise NotImplementedError # raises an exception since Deliverable class is abstract
    end
  end
end

