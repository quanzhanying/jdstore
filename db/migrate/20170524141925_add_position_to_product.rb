class AddPositionToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :position, :string
  end
end
