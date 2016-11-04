class AddPingppInfoToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :pingpp_info, :text
  end
end
