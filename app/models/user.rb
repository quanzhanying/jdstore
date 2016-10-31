class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  def admin?
    is_admin
  end

  def adm!
    self.is_admin = true
    self.save
  end

  def usr!
    self.is_admin = false
    self.save
  end

  scope :except_user, ->(user){where.not(id: user)}
end
