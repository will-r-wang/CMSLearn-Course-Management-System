class CreateAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments do |t|
      t.datetime :due_date
      t.string :submission_type
      t.integer :grade

      t.timestamps
    end
  end
end
