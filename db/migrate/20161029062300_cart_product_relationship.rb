class CartProductRelationship < ActiveRecord::Migration[5.0]
  def change
  	add_column :cart_items, :cart_id, :integer
  	add_column :cart_items, :product_id, :integer
  end
end
