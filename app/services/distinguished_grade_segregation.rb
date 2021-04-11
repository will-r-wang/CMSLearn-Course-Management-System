class DistinguishedGradeSegregation
  include FilteringStrategy

  DISTINGUISHED_GRADE_CUTOFF = 90

  def initialize(filtering_strategy = nil)
    @strategy = filtering_strategy
  end

  def get_data(input_data, options = {})
    data = @strategy ? @strategy.get_data(input_data, options) : input_data

    data.each do |data_point|
      if data_point.grade >= DISTINGUISHED_GRADE_CUTOFF
        data_point.outlier = true
      end
    end

    data
  end
end
