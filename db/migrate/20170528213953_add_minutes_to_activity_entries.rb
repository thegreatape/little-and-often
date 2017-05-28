class AddMinutesToActivityEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :activity_entries, :minutes, :integer, null: false
  end
end
