class CreateExams < ActiveRecord::Migration[5.0]
  def change
    create_table :exams do |t|
      t.string :name
      t.string :question
      t.text :answer_1
      t.text :answer_2
      t.text :answer_3
      t.text :answer_4
      t.text :answer_5
      t.text :answer_6
      t.integer :category_id

      t.string :image
      t.boolean :A, defaut: false
      t.boolean :B, defaut: false
      t.boolean :C, defaut: false
      t.boolean :D, defaut: false
      t.boolean :E, defaut: false
      t.boolean :F, defaut: false


      t.timestamps
    end
  end
end
