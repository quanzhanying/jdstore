class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  validates :nickname, presence: true   #限制用户名不得为空，但是逻辑上会和display_name冲突
  validates_format_of :nickname, with: /^(?!_)(?!.*?_$)[a-zA-Z0-9_\u4e00-\u9fa5]+$/, :multiline => true   #支持汉字、数字、字母、下划线但不能以下划线开头和结尾
  #这样就避开了用户名验证与邮箱万一乱取名的相互冲突，同时又支持中文用户名。当然也可以把上面的正则表达式删掉，也是可以支持中文的

  validates_uniqueness_of :nickname    #限制用户名唯一

  has_many :orders

  has_many :favorites

  has_many :favorite_products, :through => :favorites, :source => :product


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    is_admin
  end

  def is_member_of?(product)
    favorite_products.include?(product)
  end

  def favorite!(product)
    favorite_products << product
  end

  def unfavorite!(product)
    favorite_products.delete(product)
  end

  def display_name
    if self.nickname.present?
      self.nickname
    else
      self.email.split("@").first
    end
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.nickname || self.email
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(nickname) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:nickname].nil?
        where(conditions).first
      else
        where(nickname: conditions[:nickname]).first
      end
    end
  end

  mount_uploader :avatar, AvatarUploader


end
