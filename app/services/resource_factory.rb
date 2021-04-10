class ResourceFactory < ActivityFactory
  include ActiveModel::Model

  def initialize; end

  def create_activity(type, **kwargs)
    case type
    when "Url"
      Url.find_or_create_by!(kwargs)
    when "Video"
      Video.find_or_create_by!(kwargs)
    when "Document"
      Document.find_or_create_by!(kwargs)
    else
      raise NotImplementedError
    end
  end
end
