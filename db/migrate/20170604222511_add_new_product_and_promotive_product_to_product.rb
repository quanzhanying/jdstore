class AddNewProductAndPromotiveProductToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :new_product, :boolean, default: false #添加是否为最新商品
    add_column :products, :promotive_product, :boolean, default: false #添加是否为活动商品
  end
end
