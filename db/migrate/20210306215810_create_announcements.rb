class CreateAnnouncements < ActiveRecord::Migration[6.1]
  def change
    create_table :announcements do |t|
      t.text :announcement_content
      t.boolean :pinned

      t.timestamps
    end
  end
end
