class AddInTheCartToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :in_the_cart, :boolean, default: true
  end
end
