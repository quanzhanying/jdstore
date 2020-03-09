class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :title
      t.integer :weight, default: 0 #用於權重的字段，方便後續按不同順序展示商品

      t.integer :products_counter, default: 0 #該分類下的產品數量

      t.timestamps
    end
    add_index :categories, [:title]
  end
end
