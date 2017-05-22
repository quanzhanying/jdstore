class AddMoreDetailToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :product_id, :string
    add_column :products, :timestamp_at, :integer
    add_column :products, :price_buy, :string
    add_column :products, :price_sell, :string
    add_column :products, :price_low, :string
    add_column :products, :price_high, :string
    add_column :products, :price_last, :string
    add_column :products, :trade_vol, :string
  end
end
