module FilteringStrategy
  def get_data(input_data, options = {})
    raise NotImplementedError, "Abstract class: method missing"
  end
end
