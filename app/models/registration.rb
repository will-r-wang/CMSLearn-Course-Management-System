class Registration < ApplicationRecord
  has_one :student
  has_one :course
end
