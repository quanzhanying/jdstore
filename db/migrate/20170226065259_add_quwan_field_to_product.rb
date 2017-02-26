class AddQuwanFieldToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :quwan_goodsid, :string, default: ""#商品id
    add_column :products, :page_idx, :string #页面id
    add_column :products, :logo, :string    #商品列表logo
    add_column :products, :brand, :string   #品牌
  end
end
