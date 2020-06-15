class Choice < ApplicationRecord
  belongs_to :user
  def aa!
    self.is_aa1en = false
    self.save
  end
  def aa1!
    self.is_aa1en = true
    self.save
  end

  def bb!
    self.is_bb1en = false
    self.save
  end
  def bb1!
    self.is_bb1en = true
    self.save
  end

  def cc!
    self.is_cc1en = false
    self.save
  end
  def cc1!
    self.is_cc1en = true
    self.save
  end

  def dd!
    self.is_dd1en = false
    self.save
  end
  def dd1!
    self.is_dd1en = true
    self.save
  end

  def ee!
    self.is_ee1en = false
    self.save
  end
  def ee1!
    self.is_ee1en = true
    self.save
  end

  def ff!
    self.is_ff1en = false
    self.save
  end
  def ff1!
    self.is_ff1en = true
    self.save
  end
end
