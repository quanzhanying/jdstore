class Exam < ApplicationRecord
  belongs_to :category


  has_many :photos
  accepts_nested_attributes_for :photos

  validates :name, presence: true
  validates :question, presence: true
  validates :answer_1, presence: true
  validates :answer_2, presence: true
  validates :countdown, presence: true

  def a!
    self.is_a1en = false
    self.save
  end
  def a1!
    self.is_a1en = true
    self.save
  end

  def b!
    self.is_b1en = false
    self.save
  end
  def b1!
    self.is_b1en = true
    self.save
  end

  def c!
    self.is_c1en = false
    self.save
  end
  def c1!
    self.is_c1en = true
    self.save
  end

  def d!
    self.is_d1en = false
    self.save
  end
  def d1!
    self.is_d1en = true
    self.save
  end

  def e!
    self.is_e1en = false
    self.save
  end
  def e1!
    self.is_e1en = true
    self.save
  end

  def f!
    self.is_f1en = false
    self.save
  end
  def f1!
    self.is_f1en = true
    self.save
  end


end
