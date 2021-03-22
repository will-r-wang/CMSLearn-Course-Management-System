class CreateWebNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :web_notifications do |t|

      t.timestamps
    end
  end
end
