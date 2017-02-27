class AddCityToChefshadow < ActiveRecord::Migration[5.0]
  def change
    add_column :chef_shadows, :city, :string
  end
end
