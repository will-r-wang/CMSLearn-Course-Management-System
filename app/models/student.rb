class Student < User
  has_many :course_registrations, dependent: :delete_all
  has_many :courses, through: :course_registrations
end
