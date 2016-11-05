class AddCancellToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :is_cancell, :boolean, default: false
  end
end
