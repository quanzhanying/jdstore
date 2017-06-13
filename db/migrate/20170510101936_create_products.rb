class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :number
      t.string :name
      t.string :content
      t.text :description
      t.decimal :price, precision: 10, scale:2
      t.decimal :msrp, precision: 10, scale:2
      t.string :price_unit
      t.integer :quantity
      t.integer :category_id
      # t.string :category
      t.string :category1
      t.string :category2
      t.string :category3
      t.string :keyword
      t.string :location
      t.string :image
      t.string :img_url
      t.string :img1_url
      t.string :img2_url
      t.string :img3_url
      t.string :img4_url
      t.string :img5_url
      t.string :remark
      t.string :status
      t.string :position
      t.timestamps
    end
  end
end
