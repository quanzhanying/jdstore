class AddUserToCart < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :user_id, :integer
  end
end
