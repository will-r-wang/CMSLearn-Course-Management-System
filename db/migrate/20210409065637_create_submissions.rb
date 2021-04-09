class CreateSubmissions < ActiveRecord::Migration[6.1]
  def change
    create_table :submissions do |t|
      t.references :deliverable, null: true, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :hyperlink

      t.timestamps
    end
  end
end
