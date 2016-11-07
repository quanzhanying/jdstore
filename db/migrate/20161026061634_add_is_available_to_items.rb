class AddIsAvailableToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :is_available, :boolean, default: false
  end
end
