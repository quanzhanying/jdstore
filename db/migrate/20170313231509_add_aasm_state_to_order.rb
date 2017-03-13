class AddAasmStateToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :order, :aasm_state, :string, default: "order_placed"
    add_index :order, :aasm_state
  end
end
