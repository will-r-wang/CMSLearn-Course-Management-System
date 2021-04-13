class RegularSegregation
  include FilteringStrategy

  def initialize
    raise NotImplementedError, "This must be implemented in the subclass"
  end

  def get_data(input_data, options = {})
    raise NotImplementedError, "This must be implemented in the subclass"
  end
end
