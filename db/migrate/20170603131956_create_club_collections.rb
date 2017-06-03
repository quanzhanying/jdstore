class CreateClubCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :club_collections do |t|
      t.integer :club_id
      t.integer :user_id

      t.timestamps
    end
  end
end
