class CreateCartTemplateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_template_items do |t|
        t.integer :cart_id
        t.integer :template_id
      t.timestamps
    end
  end
end
