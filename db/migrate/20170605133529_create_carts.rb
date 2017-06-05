class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
        has_many :cart_items
        has_many :products, through: :cart_items, source: :product

      t.timestamps
    end
  end
end
