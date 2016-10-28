class AddOrderIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :order_id, :integer
  end
end
