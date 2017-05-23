class CreateExams < ActiveRecord::Migration[5.0]
  def change
    create_table :exams do |t|
      t.string :name
      t.string :question
      t.text :answer_1


      t.string :image

      t.timestamps
    end
  end
end
