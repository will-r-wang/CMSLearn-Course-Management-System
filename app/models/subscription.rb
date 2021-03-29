class Subscription < ApplicationRecord
  belongs_to :student
  belongs_to :announcement_manager
end
