class AddPhoneToChef < ActiveRecord::Migration[5.0]
  def change
    add_column :chefs, :phone, :string
  end
end
