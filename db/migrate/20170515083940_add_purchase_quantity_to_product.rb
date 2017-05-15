class AddPurchaseQuantityToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products,:purchase_quantity,:integer,default: 1
  end
end
