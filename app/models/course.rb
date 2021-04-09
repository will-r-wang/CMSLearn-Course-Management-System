class Course < ApplicationRecord
  belongs_to :semester
  belongs_to :teacher
  has_many :course_registrations, dependent: :delete_all
  has_many :users, -> { where(course_registrations: { status: "approved" }) }, through: :course_registrations
  has_many :activity
  has_many :announcement

  def enrolled_students
    CourseRegistration.where(course_id: id, status: "approved").count
  end

  def pending_registration?
    !CourseRegistration.where(course_id: id, status: "pending").empty?
  end

  def registered?
    !CourseRegistration.where(course_id: id, status: "approved").empty?
  end
end
