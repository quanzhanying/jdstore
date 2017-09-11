class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.integer :product_id
      t.integer :user_id

      t.timestamps
    end
  end
end
