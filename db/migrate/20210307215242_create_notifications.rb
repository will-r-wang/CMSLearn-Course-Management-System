class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.string :delivery_method

      t.timestamps
    end
  end
end
