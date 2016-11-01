class AddTokenindexTo < ActiveRecord::Migration[5.0]
  def change
    add_index :orders, :token
  end
end
