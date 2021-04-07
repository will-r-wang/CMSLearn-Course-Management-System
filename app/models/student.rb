class Student < User
  has_many :student_courses
  has_many :courses, through: :student_courses
  has_many :course_registrations, dependent: :delete_all
end
