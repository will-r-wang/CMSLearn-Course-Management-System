class RenameRegistrationsToCourseRegistrations < ActiveRecord::Migration[6.1]
  def change
    rename_table :registrations, :course_registrations
  end
end
