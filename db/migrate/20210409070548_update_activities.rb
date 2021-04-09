class UpdateActivities < ActiveRecord::Migration[6.1]
  def change
    drop_table :activities
    drop_table :urls
    drop_table :documents
    drop_table :videos
    drop_table :quizzes
    drop_table :assignments
    drop_table :tutorials

    add_reference :deliverables, :course, index: true
    add_reference :resources, :course, index: true
    add_column :deliverables, :title, :string
    add_column :resources, :title, :string

    add_column :deliverables, :type, :string
    remove_column :deliverables, :proctored
  end
end
