require_relative "shirt"
require_relative "brand"
require "pry"

nike = Brand.new("Nike")
fitch = Brand.new("Fitch")
shirt_one = Shirt.new("black", fitch)
shirt_two = Shirt.new("turquoise", fitch)
shirt_three = Shirt.new("red", nike)

binding.pry
