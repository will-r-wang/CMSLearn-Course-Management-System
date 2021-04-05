class AddTeacherIdToCourses < ActiveRecord::Migration[6.1]
  def change
    add_reference :courses, :teacher, index: true
  end
end
