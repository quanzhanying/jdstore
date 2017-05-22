class Add5xhttpImagesToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :http_image, :string
    add_column :products, :http_image2, :string
    add_column :products, :http_image3, :string
    add_column :products, :http_image4, :string
    add_column :products, :http_image5, :string  #商品详情图片
  end
end
