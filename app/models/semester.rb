class Semester < ApplicationRecord
  validates :name, uniqueness: true
end
