class AddUserIdToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders , :user_id, :integre
  end
end
