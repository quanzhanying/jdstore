class AddAnimalAndProtectThemAndIsHiddenToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products,:is_hidden,:boolean,default:false
    add_column :products,:protect_them,:boolean,default:false
    add_column :products, :animal, :string, default:"normal"
  end
end
