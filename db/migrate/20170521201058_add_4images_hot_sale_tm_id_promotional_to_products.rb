class Add4imagesHotSaleTmIdPromotionalToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :image2, :string
    add_column :products, :image3, :string
    add_column :products, :image4, :string
    add_column :products, :image5, :string  #商品详情图片
    add_column :products, :hot, :boolean, default: false  #是否热销-用于首页和侧边栏
    add_column :products, :sale, :integer    #销量
    add_column :products, :tm_id, :string
    add_column :products, :promotional, :integer #促销价
    add_column :products, :product_type, :string    #产品分类
  end
end
