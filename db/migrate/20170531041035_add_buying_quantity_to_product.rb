class AddBuyingQuantityToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :buying_quantity, :integer, default: 1
  end
end
