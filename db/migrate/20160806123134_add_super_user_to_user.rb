class AddSuperUserToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :super_user,:boolean, default: false
  end
end
