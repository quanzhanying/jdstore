class CreateIntroducePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :introduce_pictures do |t|
      t.integer :product_id
      t.string :avatar

      t.timestamps
    end
  end
end
