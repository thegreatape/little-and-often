class AddColorToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :color, :string
  end
end
