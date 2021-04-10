class Submission < ApplicationRecord
  belongs_to :deliverable
  belongs_to :user
end
