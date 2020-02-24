require_relative "animal"

class Cat < Animal
  # attr_reader :name
  # attr_accessor :mood
  attr_accessor :virality

  def initialize(name)
    super
    @virality = 9
    @mood = 'oopsie'
  end


end

# kitty = Cat.new("kitty")
#
# kitty.sound_off
