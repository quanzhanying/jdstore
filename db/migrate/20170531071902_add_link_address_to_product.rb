class AddLinkAddressToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :link_address, :string 
  end
end
