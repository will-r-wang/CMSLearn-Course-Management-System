class ActivityFactory
  include ActiveModel::Model

  def initialize
    raise NotImplementedError
  end

  def create_activity(type, **kwargs)
    raise NotImplementedError
  end
end
