class AddHeightToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :height, :float
  end
end
