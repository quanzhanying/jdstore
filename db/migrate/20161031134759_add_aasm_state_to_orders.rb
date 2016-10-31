class AddAasmStateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :aasm_state, :string
  end
end
