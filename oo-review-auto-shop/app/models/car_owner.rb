class CarOwner

  @@all = []
  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def cars
    # sift thru all cars, matching whether owner of car is me
    Car.all.select do |car|
      car.owner == self
    end
  end


end
