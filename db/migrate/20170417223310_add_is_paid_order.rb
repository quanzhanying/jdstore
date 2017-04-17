class AddIsPaidOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :is_paid, :boolean, default: false
    add_column :orders, :payment_method, :string
  end
end
