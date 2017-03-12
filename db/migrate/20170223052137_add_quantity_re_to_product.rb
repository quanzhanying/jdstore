class AddQuantityReToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :quantity_re, :integer
  end
end
