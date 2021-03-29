class AddColumnsToSubscription < ActiveRecord::Migration[6.1]
  def change
    add_column :subscriptions, :student_id, :integer
    add_column :subscriptions, :announcement_manager_id, :integer
  end
end
