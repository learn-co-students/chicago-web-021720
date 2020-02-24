require_relative 'submergable'

class Fish < Animal
  include Submergable
  # attr_reader :name
  # attr_accessor :mood

  # def initialize(name)
  #   @name = name
  #   @mood = 'nervous'
  # end
end
