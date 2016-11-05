class ChangeProductListsTableColumns < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :billing_name, :string
    change_column :orders, :shipping_name, :string
  end
end
