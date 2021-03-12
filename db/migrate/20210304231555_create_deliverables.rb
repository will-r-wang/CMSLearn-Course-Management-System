class CreateDeliverables < ActiveRecord::Migration[6.1]
  def change
    create_table :deliverables do |t|
      t.integer :weight, default: 0
      t.boolean :proctored, default: false

      t.timestamps
    end
  end
end
