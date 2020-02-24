module Submergable
  attr_accessor :underwater

  def is_underwater?
    self.underwater
  end

  def dive_down!
    self.underwater = true
  end

  def splash_up!
    self.underwater = false
  end
end
