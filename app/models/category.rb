class Category < ApplicationRecord

  before_validation :correct_ancestry

  validates :title, presence: { message: "名稱不得為空" }
  validates :title, uniqueness: { message: "名稱不得重複"}

  has_ancestry orphan_strategy: :destroy

  has_many :products, dependent: :destroy

  private
  def correct_ancestry
    self.ancestry = nil if self.ancestry.blank?
  end

end
