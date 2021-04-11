class CompositeFilteringStrategy
  def initialize
    @strategies = []
  end

  def get_data(input_data)
    @data ||= input_data
    @strategies.each do |strategy|
      @data = strategy.get_data(@data)
    end

    @data
  end

  def add_strategy(strategy)
    @strategies << strategy
  end
end
