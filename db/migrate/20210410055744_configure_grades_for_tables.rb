class ConfigureGradesForTables < ActiveRecord::Migration[6.1]
  def change
    add_column :submissions, :grade, :integer
    add_column :submissions, :comment, :string
    rename_column :course_registrations, :final_grade, :grade
  end
end
