class Activity < ApplicationRecord
  belongs_to :course
  self.abstract_class = true
end
