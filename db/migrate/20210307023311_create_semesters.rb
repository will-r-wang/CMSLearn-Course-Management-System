class CreateSemesters < ActiveRecord::Migration[6.1]
  def change
    create_table :semesters do |t|
      t.date :start_date
      t.date :end_date
      t.date :registration_deadline

      t.timestamps
    end
  end
end
