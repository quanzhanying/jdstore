class ChangeBillingAddressToOrder < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :billing_address, :string
  end
end
