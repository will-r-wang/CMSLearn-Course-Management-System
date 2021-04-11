class AddGenderAndAgeForUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :gender, :string
    add_column :users, :age, :integer
  end
end
