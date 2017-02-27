class AddCommentToChefComment < ActiveRecord::Migration[5.0]
  def change
    add_column :chef_comments, :comment, :text
  end
end
