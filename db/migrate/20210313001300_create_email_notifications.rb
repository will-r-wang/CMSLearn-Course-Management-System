class CreateEmailNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :email_notifications do |t|

      t.timestamps
    end
  end
end
