class AddUserIdToClubVote < ActiveRecord::Migration[5.0]
  def change
    add_column :club_votes, :user_id, :integer
  end
end
