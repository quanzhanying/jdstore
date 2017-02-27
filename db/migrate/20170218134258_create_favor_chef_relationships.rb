class CreateFavorChefRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :favor_chef_relationships do |t|
      t.integer :group_id
      t.integer :user_id

      t.timestamps
    end
  end
end
