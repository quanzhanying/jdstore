class FixPaymentMethodToOrder < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :parment_method, :payment_method
  end
end
