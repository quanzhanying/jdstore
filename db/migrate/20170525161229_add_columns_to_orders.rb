class AddColumnsToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :phone, :integer #添加电话栏位到订单下
  end
end
