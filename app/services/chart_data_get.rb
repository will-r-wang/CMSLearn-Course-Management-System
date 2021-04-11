class ChartDataGet
  include ActiveModel::Model

  DataPoint = Struct.new(:student, :grade, :outlier)

  def initialize(input_data)
    @input_data = input_data.map do |id, grade|
      DataPoint.new(Student.find(id), grade, false)
    end

    @input_data = DistinguishedGradeSegregation.new.get_data(@input_data)
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
