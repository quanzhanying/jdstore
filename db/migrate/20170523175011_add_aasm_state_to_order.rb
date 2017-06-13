class AddAasmStateToOrder < ActiveRecord::Migration[5.0]
  def change
    add_index  :orders, :aasm_state
  end
end
