class CourseRegistration < ApplicationRecord
  has_one :student
  has_one :course
end