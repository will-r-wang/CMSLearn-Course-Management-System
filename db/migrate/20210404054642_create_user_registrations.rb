class CreateUserRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :user_registrations do |t|
      t.string :status
      t.string :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
