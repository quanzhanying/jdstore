class AddOrderToCart < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :order, :string
  end
end
