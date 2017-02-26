class CreateGoodsAttrs < ActiveRecord::Migration[5.0]
  def change
    create_table :goods_attrs do |t|
      t.string :quwan_goodsid, null: false
      t.string :attr_name, null: false
      t.string :attr_value

      t.timestamps
    end
    add_index :goods_attrs, :quwan_goodsid
  end


end
