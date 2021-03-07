class CreateCourseAddOns < ActiveRecord::Migration[6.1]
  def change
    create_table :course_add_ons do |t|
      t.string :type

      t.timestamps
    end
  end
end
