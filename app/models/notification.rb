class Notification < ApplicationRecord
  belongs_to :student
  belongs_to :course

  self.abstract_class = true
end
