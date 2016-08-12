class ChangeIsPaddToIsPaidInOrders < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :is_padd, :is_paid
  end
end
