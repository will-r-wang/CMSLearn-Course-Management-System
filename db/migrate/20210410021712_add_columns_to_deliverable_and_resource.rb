class AddColumnsToDeliverableAndResource < ActiveRecord::Migration[6.1]
  def change
    add_column :deliverables, :instructions, :string
    add_column :resources, :description, :string
  end
end
