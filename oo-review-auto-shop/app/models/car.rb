class Car

  @@all = []

  attr_reader :make, :model, :classification, :owner
  attr_accessor :mechanic

  # UNDER THE HOOD ATTR ACCESSOR FOR MECHANIC
  # def mechanic
  #   @mechanic
  # end

  # def mechanic=(mechanic)
  #   @mechanic = mechanic
  # end


  def initialize(make, model, classification, owner)
    @make = make
    @model = model
    @classification = classification
    @owner = owner
    @@all << self
  end

  def self.all
    @@all
  end

  def qualified_mechanics
    # iterate through all mechanics
    # mechanic specialty might match my own classification
    Mechanic.all.select do |mechanic|
      mechanic.specialty == self.classification
    end
  end

  def add_mechanic(mechanic)
    if qualified_mechanics.include?(mechanic)
      self.mechanic = mechanic
    else
      raise ArgumentError, "Sorry, #{mechanic.name} is authorized to work on vehicles with type `#{mechanic.specialty}`, but this vehicle has type `#{self.classification}`. Please try someone else!"
    end
  end

end
