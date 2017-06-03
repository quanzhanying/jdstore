class CreateClubVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :club_votes do |t|
      t.integer :club_id

      t.timestamps
    end
  end
end
