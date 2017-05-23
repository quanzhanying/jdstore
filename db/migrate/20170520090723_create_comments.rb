class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
