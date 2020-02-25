require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


p odin = CarOwner.new("Odin Odinson")

scorpio = Car.new("Merkur", "Scorpio", "clunker", odin)
bizzorpio = Car.new("Rukrem", "Oiprocs", "exotic", nil)

p Car.all

ben = Mechanic.new("Ben", "exotic")
jan = Mechanic.new("Jan", "antique")
han = Mechanic.new("Han", "clunker")


p Mechanic.all

cars = odin.cars

p scorpio.qualified_mechanics
bizzorpio.add_mechanic(ben)
# bizzorpio.add_mechanic(han) # should error out because of classification/specialty mismatch

binding.pry
