class User < ApplicationRecord
  validates :username, uniqueness: true
  belongs_to :user_registration, optional: true
  has_many :user_registrations, dependent: :delete_all
  has_many :course_registrations, dependent: :delete_all
  has_many :courses, through: :course_registrations

  has_secure_password

  def full_name
    first_name + ' ' + last_name
  rescue NoMethodError
    username
  end
end
