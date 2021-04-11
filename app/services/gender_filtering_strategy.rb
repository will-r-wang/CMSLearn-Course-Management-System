class GenderFilteringStrategy
  include FilteringStrategy

  def get_data(input_data, options = { gender: "male" })
    data = input_data.select do |data_point|
      data_point.student.gender == options[:gender]
    end

    data
  end
end
