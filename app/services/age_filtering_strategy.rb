class AgeFilteringStrategy
  include FilteringStrategy

  def get_data(input_data, options = { minimum_age: 20 })
    data = input_data.select do |data_point|
      data_point.student.age >= options[:minimum_age]
    end

    data
  end
end
