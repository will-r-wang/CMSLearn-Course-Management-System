class GenderFilteringStrategy
  include FilteringStrategy

  def get_data(input_data, options = {})
    data = input_data.select do |student, grade|
      student.gender == options[:gender]
    end

    data
  end
end
