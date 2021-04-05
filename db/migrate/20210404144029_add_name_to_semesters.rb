class AddNameToSemesters < ActiveRecord::Migration[6.1]
  def change
    add_column :semesters, :name, :string
  end
end
