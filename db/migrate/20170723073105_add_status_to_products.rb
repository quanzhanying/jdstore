class AddStatusToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :status, :string, :default => "draft"
  end
end
