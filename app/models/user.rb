class User < ApplicationRecord
  # ....

  def admin?
    is_admin
  end


 end