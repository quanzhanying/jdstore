class CreateTemplateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :template_lists do |t|
      t.integer :order_id
      t.string  :tempalte_name
      t.integer :template_price
      t.timestamps
    end
  end
end
