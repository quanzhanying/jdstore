class CreateGroupships < ActiveRecord::Migration[5.0]
  def change
    create_table :groupships do |t|
      t.integer :product_id
      t.integer :group_id
      
      t.timestamps
    end
  end
end
