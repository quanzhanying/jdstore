class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string  :true_answer
      t.text    :description
      t.string  :image

      t.timestamps
    end
  end
end
