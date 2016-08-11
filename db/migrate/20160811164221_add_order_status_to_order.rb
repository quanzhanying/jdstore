class AddOrderStatusToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :order_state, :string, default: "等待付款"
  end
end
