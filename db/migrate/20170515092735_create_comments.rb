class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :product_id
      t.integer :user_id
      t.string :image
      t.integer :function
      t.integer :design
      t.integer :experience

      t.timestamps
    end
  end
end
