class ChartDataGet
  include ActiveModel::Model

  DataPoint = Struct.new(:student, :grade, :outlier)

  def initialize(input_data)
    @input_data = input_data.map do |id, grade|
      DataPoint.new(Student.find(id), grade, false)
    end

    # Not fully complete since it requires a functional front-end responsive form to toggle different filters
    # To implement this, we would need a new handler in the home action of the pages controller to check for params and dynamically display the selected filters
    # Incomplete due to time constraints

    # Uncomment the below to show different SDC visualizations
    # --- SDC with two filters applied (Gender and Age) and basic decorator filtering
    strategy = CompositeFilteringStrategy.new
    strategy.add_strategy(GenderFilteringStrategy.new)
    strategy.add_strategy(AgeFilteringStrategy.new)
    @input_data = DistinguishedGradeSegregation.new.get_data(strategy.get_data(@input_data))

    # --- SDC with basic decorator filtering (no strategies applied) ---
    # @input_data = DistinguishedGradeSegregation.new.get_data(@input_data)

    # --- SDC without decorator filtering (Gender strategy applied) ---
    # @input_data = GenderFilteringStrategy.new.get_data(@input_data)
  end

  def formatted_data
    [{
      name: "Data",
      data: @input_data.map { |data_point| [data_point[:student].id, data_point[:grade]] unless data_point[:outlier] }.compact
    },
    {
      name: "Outliers",
      data: @input_data.map { |data_point| [data_point[:student].id, data_point[:grade]] if data_point[:outlier] }.compact
    }]
  end
end
