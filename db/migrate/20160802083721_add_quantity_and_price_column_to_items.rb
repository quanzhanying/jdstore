class AddQuantityAndPriceColumnToItems < ActiveRecord::Migration[5.0]
  def change
  	add_column :items, :quantity, :integer
  	add_column :items, :price, :float
  end
end
