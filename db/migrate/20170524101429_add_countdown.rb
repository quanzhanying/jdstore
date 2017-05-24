class AddCountdown < ActiveRecord::Migration[5.0]
  def change
    add_column :exams, :countdown, :string
  end
end
