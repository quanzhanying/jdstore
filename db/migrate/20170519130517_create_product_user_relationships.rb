class CreateProductUserRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :product_user_relationships do |t|
      t.integer :product_id
      t.integer :user_id
      t.timestamps
    end
  end
end
