class AddStatusToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :status, :string, default: 'none'
  end
end
