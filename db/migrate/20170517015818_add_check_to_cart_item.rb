class AddCheckToCartItem < ActiveRecord::Migration[5.0]
  def change
    add_column :cart_items, :is_choosed, :boolean, default: true
  end
end
