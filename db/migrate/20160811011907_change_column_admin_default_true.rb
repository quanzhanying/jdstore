class ChangeColumnAdminDefaultTrue < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :is_admin, :boolean, default: true
  end
end
