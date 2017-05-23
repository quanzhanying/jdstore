class AddIsTrueToExam < ActiveRecord::Migration[5.0]
  def change
    add_column :exams, :is_true, :boolean, default: false
  end
end
