class AddPhonenumToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :phonenum, :integer
  end
end
