class DropCourseAddOns < ActiveRecord::Migration[6.1]
  def up
    drop_table :course_add_ons
  end
end
