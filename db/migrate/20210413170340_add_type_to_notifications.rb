class AddTypeToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :type, :string
  end
end
