class CreateActivityEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :activity_entries do |t|
      t.references :activity, null: false
      t.date :performed_on

      t.timestamps
    end

    add_foreign_key :activity_entries, :activities
  end
end
