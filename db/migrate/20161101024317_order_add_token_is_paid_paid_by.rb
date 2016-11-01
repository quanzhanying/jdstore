class OrderAddTokenIsPaidPaidBy < ActiveRecord::Migration[5.0]
  def change
  	add_column :orders, :token, :string
  	add_column :orders, :is_paid, :boolean, :default => false
  	add_column :orders, :paid_by, :string
  end
end
