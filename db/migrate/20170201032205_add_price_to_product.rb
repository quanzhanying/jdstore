class AddPriceToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :price,:integer
  end
end
