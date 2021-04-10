class DropUsersTables < ActiveRecord::Migration[6.1]
  def change
    drop_table :students
    drop_table :teachers
    drop_table :admins
  end
end
