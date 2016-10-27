class AddEmailToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :email, :string
  end
end
