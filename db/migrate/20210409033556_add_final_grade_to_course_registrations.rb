class AddFinalGradeToCourseRegistrations < ActiveRecord::Migration[6.1]
  def change
    add_column :course_registrations, :final_grade, :integer
  end
end
