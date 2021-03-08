class AddStudentIdColumnToStudents < ActiveRecord::Migration[6.1]
  def self.up
    add_column :students, :student_id, :string
  end
end
