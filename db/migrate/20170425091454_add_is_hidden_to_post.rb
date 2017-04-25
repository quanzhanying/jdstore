class AddIsHiddenToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :is_hidden, :boolean, default: true
  end
end
