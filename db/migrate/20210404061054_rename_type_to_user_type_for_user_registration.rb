class RenameTypeToUserTypeForUserRegistration < ActiveRecord::Migration[6.1]
  def change
    rename_column :user_registrations, :type, :user_type
  end
end
