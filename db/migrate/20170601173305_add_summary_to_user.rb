class AddSummaryToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :summary, :text
  end
end
