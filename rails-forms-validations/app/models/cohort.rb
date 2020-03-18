class Cohort < ApplicationRecord
  has_many :students, :dependent => :delete_all
  
  def cohort_name
    self.name.downcase
  end

  def cohort_name=(new_name)
    self.name = new_name.downcase
  end
end
