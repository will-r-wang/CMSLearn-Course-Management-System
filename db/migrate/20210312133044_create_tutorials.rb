class CreateTutorials < ActiveRecord::Migration[6.1]
  def change
    create_table :tutorials do |t|

      t.timestamps
    end
  end
end
