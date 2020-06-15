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
      t.boolean :is_a1en, defaut: false
      t.boolean :is_b1en, defaut: false
      t.boolean :is_c1en, defaut: false
      t.boolean :is_d1en, defaut: false
      t.boolean :is_e1en, defaut: false
      t.boolean :is_f1en, defaut: false

      t.string :countdown


      t.timestamps
    end
  end
end
