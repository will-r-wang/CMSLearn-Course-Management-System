class Department < ApplicationRecord
  has_many :course
  has_many :teacher
end
