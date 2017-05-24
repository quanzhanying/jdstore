class AddAnswerToQuestion < ActiveRecord::Migration[5.0]
    def change
        add_column :questions, :answer, :text
    end
end
