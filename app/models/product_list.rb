class ProductList < ApplicationRecord
  belongs_to :order
  def change
    create_table :product_lists do |t|
      t.integer :order_id
      t.string  :product_name
      t.integer :product_price
      t.integer :quantity
    end
  end
end
