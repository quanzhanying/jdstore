class CreateGoodsImages < ActiveRecord::Migration[5.0]
  def change
    create_table :goods_images do |t|
      t.string :quwan_goodsid, null: false
      t.string :img_type, null: false
      t.string :url, null: false
      t.integer :idx, default:0

      t.timestamps
    end
    add_index :goods_images, :quwan_goodsid
  end


end
