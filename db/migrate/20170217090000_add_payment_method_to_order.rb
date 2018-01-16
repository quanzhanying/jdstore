class AddPaymentMethodToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :parment_method, :string
  end
end
