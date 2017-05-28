class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.references :user
      t.string :name

      t.timestamps
    end

    add_foreign_key :activities, :users
  end
end
