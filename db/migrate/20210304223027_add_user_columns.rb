class AddUserColumns < ActiveRecord::Migration[6.1]
  def self.up
    add_column :users, :password, :string
    add_column :users, :email, :string
  end
end
