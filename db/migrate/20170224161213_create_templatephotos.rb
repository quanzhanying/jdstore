class CreateTemplatephotos < ActiveRecord::Migration[5.0]
  def change
    create_table :templatephotos do |t|
      t.integer :template_id
      t.string :image

      t.timestamps
    end
  end
end
