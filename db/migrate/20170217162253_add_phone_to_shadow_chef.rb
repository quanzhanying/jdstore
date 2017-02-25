class AddPhoneToShadowChef < ActiveRecord::Migration[5.0]
  def change
    add_column :chef_shadows, :chef_level_id, :integer
    add_column :chef_shadows, :phone, :string
    remove_column :chef_shadows, :level
  end
end
