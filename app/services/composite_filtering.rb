class CompositeFilteringStrategy
  def get_data(input_data, options = {})
    @strategies.each do |strategy|
      @data = strategy.get_data(@data, options)
    end

    @data
  end

  def add_strategy(strategy)
    @strategies << strategy
  end
end
