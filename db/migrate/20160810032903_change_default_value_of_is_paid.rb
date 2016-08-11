class ChangeDefaultValueOfIsPaid < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :is_paid, :boolean, default: false
  end
end
