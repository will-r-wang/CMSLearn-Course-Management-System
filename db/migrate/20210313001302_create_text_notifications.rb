class CreateTextNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :text_notifications do |t|

      t.timestamps
    end
  end
end
