class AddCityToChef < ActiveRecord::Migration[5.0]
  def change
    add_column :chefs, :city, :string
  end
end
