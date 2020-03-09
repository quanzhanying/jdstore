class Category < ApplicationRecord

  validates :title, presence: { message: "名稱不得為空" }
  validates :title, uniqueness: { message: "名稱不得重複"}

  has_ancestry orphan_strategy: :destroy #刪除一級分類時，二級分類自動刪除

  has_many :products, dependent: :destroy

  before_validation :correct_ancestry

  #保證可以在多個頁面中，取得一二級分類

  def self.grouped_data
    self.roots.order("weight desc").inject([]) do |result, parent|
      row = []
      row << parent
      row << parent.children.order("weight desc")
      result << row
    end
  end

  private
  def correct_ancestry
    self.ancestry = nil if self.ancestry.blank?
  end

end
