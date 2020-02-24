class Animal
  attr_reader :name
  attr_accessor :mood

  def initialize(name)
    p "*****IN ANIMAL INTIIALIZE*****"
    @name = name
    @mood = 'nervous'
  end

  def sound_off
    puts "I am a #{self.class.to_s.downcase} and I like to say:"
  end
end
