class ResourceFactory < ActivityFactory
  include ActiveModel::Model

  def initialize; end

  def create_activity(type, **kwargs)
    case type
    when "Url"
      Url.find_or_create_by!(kwargs)
    when "Assignment"
      Assignment.find_or_create_by!(kwargs)
    when "Tutorial"
      Tutorial.find_or_create_by!(kwargs)
    else
      raise NotImplementedError
    end
  end
end
