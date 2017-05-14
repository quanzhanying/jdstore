class CreateClassficationSubs < ActiveRecord::Migration[5.0]
  def change
    create_table :classfication_subs do |t|
      t.string :title
      t.text :description
      t.integer :classfication_pri_id

      t.timestamps
    end
  end
end
