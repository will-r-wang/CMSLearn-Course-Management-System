class Student < User
  has_many :student_courses
  has_many :courses, through: :student_courses
end
