class Shirt
  attr_accessor :color
  attr_reader :brand
  
  @@all = []

  def initialize(color, brand)
    @color = color
    @brand = brand
    @@all << self
  end

  def self.all
    @@all
  end
end