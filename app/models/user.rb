class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    is_admin
  end

  scope :all_except, -> (user) {where.not(id: user)}

  # def render_is_admin_status
  #   if current_user.is_admin
  #   content_tag(:span, "", :class => "fa fa-")
  #   else
  #
end
