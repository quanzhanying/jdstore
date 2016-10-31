class AddOrderIdToCartItems < ActiveRecord::Migration[5.0]
  def change
  	add_column :cart_items, :order_id, :integer
  end
end
