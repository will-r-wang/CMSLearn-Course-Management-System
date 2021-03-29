class AddColumnsToNotification < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :student_id, :integer
    add_column :notifications, :course_id, :integer
  end
end
