class AddPaymentMethodToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :payment_mathod, :string
  end
end
