# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  is_admin               :boolean          default(FALSE)
#  role                   :integer          default(0)
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :product_relations
  has_many :bookmarked_products, :through => :product_relations, :source => :product

  def add_bookmark!(product)
    bookmarked_products << product
  end

  def removebookmark!(product)
    bookmarked_products.delete(product)
  end

  def is_bookmark_of?(product)
    bookmarked_products.include?(product)
  end

  def admin?
    self.is_admin
  end

  def to_user!
    if self.role != 0
      self.role = 0
      self.save
    end
  end

  def to_admin!
    if self.role != 1
      self.role = 1
      self.save
    end
  end
end
