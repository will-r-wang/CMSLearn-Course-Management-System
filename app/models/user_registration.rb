class UserRegistration < ApplicationRecord
  validates :status, inclusion: { in: %w(pending approved denied) }
  validates :user_type, inclusion: { in: %w(student teacher admin) }
  belongs_to :user
end
