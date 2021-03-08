class RenameUserColumns < ActiveRecord::Migration[6.1]
  def self.up
    rename_column :users, :fname, :first_name
    rename_column :users, :lname, :last_name
  end
end
