class CreateGoodsPages < ActiveRecord::Migration[5.0]
  def change
    create_table :goods_pages do |t|
      t.string :quwan_goodsid, null: false
      t.string :page_idx, null: false
      t.string :page_title, null: false

      t.timestamps
    end
    add_index :goods_pages, :quwan_goodsid
    add_index :goods_pages, :page_idx
  end


end
