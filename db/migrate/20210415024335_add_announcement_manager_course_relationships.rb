class AddAnnouncementManagerCourseRelationships < ActiveRecord::Migration[6.1]
  def change
    add_reference :courses, :announcement_manager, index: true
    add_reference :announcement_managers, :course, index: true
  end
end
