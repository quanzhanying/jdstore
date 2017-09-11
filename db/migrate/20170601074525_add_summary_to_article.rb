class AddSummaryToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :summary, :text
  end
end
