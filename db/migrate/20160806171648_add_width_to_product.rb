class AddWidthToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :width, :float
  end
end
