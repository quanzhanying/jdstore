class AddPositionToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :position, :integer

    Article.order(:updated_at).each.with_index(1) do |article, index|
       article.update_column :position, index
    end
  end
end
