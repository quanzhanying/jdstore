class CreateProductLists < ActiveRecord::Migration[5.0]
  def change
    create_table :product_lists do |t|

      t.timestamps
    end
  end
end
