class AddAvatarToMenus < ActiveRecord::Migration[5.0]
  def change
    add_column :menus, :avatar, :string
  end
end
