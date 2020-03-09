class AddMoreDetailsToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :category_id, :integer
    add_column :products, :status, :string, default: 'off'
    #指示商品狀態，如上架、下架，設置為string模式方便後續增加狀態數量，而且更為直觀

    add_column :products, :uuid, :string
    #uuid是商品的序列號，教材中的不夠直觀，這樣也方便後期增加功能

    add_column :products, :msrp, :decimal, precision: 10, scale: 2
    #msrp是市場建議零售價的縮寫，用於打折等

    add_index :products, [:status, :category_id]
    add_index :products, [:category_id]
    add_index :products, [:uuid], unique: true #在數據庫層面限制序列號的唯一性

    add_index :products, [:title]
  end
end
