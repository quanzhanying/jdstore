class CreateClassficationPris < ActiveRecord::Migration[5.0]
  def change
    create_table :classfication_pris do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
