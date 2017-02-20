class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.integer :product_id
      t.string :image

      t.timestamps
    end
  end
end
