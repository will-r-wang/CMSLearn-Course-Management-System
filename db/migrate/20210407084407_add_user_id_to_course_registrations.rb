class AddUserIdToCourseRegistrations < ActiveRecord::Migration[6.1]
  def change
    add_reference :course_registrations, :user
  end
end
