class CreateFavorChefsRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :favor_chefs_relationships do |t|
      t.integer :chef_id
      t.integer :user_id

      t.timestamps
    end
  end
end
