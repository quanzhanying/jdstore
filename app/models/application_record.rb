class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def admin?
    is_admin
 end
end
