class AddIsPaidOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :is_paid, :boolean, default: false
    add_column :orders, :payment_method, :string
    add_column :orders, :aasm_state, :string, default: "order_placed"
    add_index  :orders, :aasm_state
  end
end
