class User < ApplicationRecord
  belongs_to :registration, optional: true
  has_secure_password

  def full_name
    first_name + ' ' + last_name
  end
end
