class RemoveTokenToOrder < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :token, :string
  end
end
