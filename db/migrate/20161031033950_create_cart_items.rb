class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      # 购物车id,产品id,产品数量
      t.integer :cart_id
      t.integer :product_id
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
