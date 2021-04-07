class Course < ApplicationRecord
  belongs_to :semester
  belongs_to :teacher
  has_many :course_registrations, dependent: :delete_all
  has_many :activity
  has_many :student_courses
  has_many :students, through: :student_courses
  has_many :announcement

  def enrolled_students
    student_courses.count
  end
end
