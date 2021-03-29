class User < ApplicationRecord
  belongs_to :registration, optional: true
  has_secure_password
end
