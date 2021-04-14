class Course < ApplicationRecord
  belongs_to :semester
  belongs_to :teacher
  has_many :course_registrations, dependent: :delete_all
  has_many :users, -> { where(course_registrations: { status: "approved" }) }, through: :course_registrations
  has_many :deliverables
  has_many :resources
  has_many :announcements
  has_one :announcement_manager
  after_create :setup_announcement_manager

  def enrolled_students
    CourseRegistration.where(course_id: id, status: "approved").count
  end

  def pending_registration?(user_id)
    !CourseRegistration.where(course_id: id, user_id: user_id, status: "pending").empty?
  end

  def registered?(user_id)
    !CourseRegistration.where(course_id: id, user_id: user_id, status: "approved").empty?
  end

  def setup_announcement_manager
    create_announcement_manager
    self.announcement_manager_id = AnnouncementManager.last.id
  end
end
