class CreateRelationshipItemAndUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :relationship_item_and_users do |t|
      t.integer :item_id
      t.integer :user_id

      t.timestamps
    end
  end
end
