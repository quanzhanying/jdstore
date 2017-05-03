class AddFriendlyIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :friendly_id, :string
    add_index :products, :friendly_id, :unique => true

    Product.find_each do |e|
      e.update( :friendly_id => SecureRandom.uuid)
    end
  end
end
