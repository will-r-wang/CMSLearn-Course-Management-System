class UpdateAllTheTables < ActiveRecord::Migration[6.1]
  def change
    remove_column :assignments, :grade
    remove_column :notifications, :delivery_method
    remove_column :students, :student_id
    remove_column :teachers, :teacher_id

    add_reference :announcements, :announcement_manager
    add_reference :courses, :department
    add_reference :notifications, :user

    add_column :notifications, :message, :string
    add_column :resources, :hyperlink, :string

    create_table :videos
    create_table :urls
    create_table :documents
    drop_table :student_courses
    drop_table :background_surveys
  end
end
