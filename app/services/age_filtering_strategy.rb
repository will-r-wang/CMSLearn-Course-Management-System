class AgeFilteringStrategy
  include FilteringStrategy

  def get_data(input_data, options = {})
    data = input_data.select do |student, grade|
      student.age >= options[:minimum_age]
    end

    data
  end
end
