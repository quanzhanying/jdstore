class AddIsOnShelfToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products,:is_on_shelf,:boolean,default:false
  end
end
