class AddLevelToChef < ActiveRecord::Migration[5.0]
  def change
    add_column :chefs, :chef_level_id, :integer
    remove_column :chefs, :level
  end
end
