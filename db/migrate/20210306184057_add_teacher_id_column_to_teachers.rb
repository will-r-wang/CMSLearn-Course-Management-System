class AddTeacherIdColumnToTeachers < ActiveRecord::Migration[6.1]
  def self.up
    add_column :teachers, :teacher_id, :string
  end
end
