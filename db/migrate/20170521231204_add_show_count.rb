class AddShowCount < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :show_count, :integer, default: 0  #商品浏览次数，用于排序显示看了又看
  end
end
