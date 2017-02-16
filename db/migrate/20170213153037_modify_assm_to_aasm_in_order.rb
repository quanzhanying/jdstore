class ModifyAssmToAasmInOrder < ActiveRecord::Migration[5.0]
  def change
    remove_index :orders, :assm_state
    rename_column :orders, :assm_state, :aasm_state
    add_index :orders, :aasm_state
  end
end
