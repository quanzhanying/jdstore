class AddPositionToChef < ActiveRecord::Migration[5.0]
  def change
    add_column :chefs, :position, :string
  end
end
