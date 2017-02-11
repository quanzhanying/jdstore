class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|

      t.interger :cart_id
      t.interger :product_id
      t.interger :quantity, default: 1

      t.timestamps
    end
  end
end
