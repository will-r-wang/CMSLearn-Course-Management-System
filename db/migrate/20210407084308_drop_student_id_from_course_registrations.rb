class DropStudentIdFromCourseRegistrations < ActiveRecord::Migration[6.1]
  def change
    remove_column :course_registrations, :student_id
  end
end
