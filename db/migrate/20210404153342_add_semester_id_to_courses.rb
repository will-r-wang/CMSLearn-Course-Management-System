class AddSemesterIdToCourses < ActiveRecord::Migration[6.1]
  def change
    add_reference :courses, :semester, index: true
  end
end
