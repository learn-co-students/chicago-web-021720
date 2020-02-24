require_relative 'fish'
require_relative 'submergable'

class Submarine
  include Submergable
  attr_accessor :name

  def initialize(name, underwater=false)
    @name = name
    @underwater = underwater
  end

end

sub = Submarine.new("Bill's Bathysphere")

puts "Sub initializes out of water:"
p sub.is_underwater? == false

puts "Sub can dive down into water:"
sub.dive_down!
p sub.is_underwater? == true

puts "Sub can splash up out of the water:"
sub.splash_up!
p sub.is_underwater? == false

fish = Fish.new("marky")

puts "Fish initializes out of water and is nervous:"
p fish.is_underwater? == false
p fish.mood == 'nervous'

puts "Fish can dive down into water:"
fish.dive_down!
p fish.is_underwater? == true

puts "Fish can splash up out of the water:"
fish.splash_up!
p fish.is_underwater? == false
