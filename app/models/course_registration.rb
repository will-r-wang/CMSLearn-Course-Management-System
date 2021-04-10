class CourseRegistration < ApplicationRecord
  belongs_to :course
  belongs_to :user

  def final_grade
    100
  end
end
