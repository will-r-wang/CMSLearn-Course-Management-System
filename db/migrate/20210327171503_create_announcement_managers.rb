class CreateAnnouncementManagers < ActiveRecord::Migration[6.1]
  def change
    create_table :announcement_managers do |t|

      t.timestamps
    end
  end
end
