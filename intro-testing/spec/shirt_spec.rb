# 👆 RSpec Test filenames end in "_spec.rb" by convention.

# Either we have a spec_helper file with the job of requiring our testable Ruby files for us, or else we need to do it manually.
require_relative '../brand'
require_relative '../shirt'

# There are different scopes to manage in an RSpec file.
# The top-level scope is the "describe" scope.
# Each of these scopes helps RSpec create readable output for the user running the tests.

describe "Shirt" do

  let(:brand)do
    puts "setting BRAND value"
    Brand.new("LRG") 
  end

  let(:shirt)do 
    puts "setting SHIRT value"
    Shirt.new("gray", brand)
  end

  # within a "describe" we can nest a scope called "context"
  # this helps us differentiate between groups of tests
  # which work on the same thing being described

  context "class methods" do

    # Now we're ready to write actual tests!
    # For that, we have an "it" scope.
    # Each "it" block is a single test.


    # When RSpec runs, it goes through every file in the "spec" folder and runs each "it" block within those files. 
    # Those "describe" and "context" strings, up at the top of the blocks we're nested in? They're used to cobble together readable test output in the terminal. 
    # Look at the "it" block's string below and then look how it gets attached to the strings "Shirt" and "class methods" in the RSpec test output.

    it ".all can return a list of all Shirts that have been initialized" do

      # This first test of ours merits a longer explanation.
      # We can think of a pattern called GIVEN-WHEN-THEN as we write a test.
      # We establish the "given" we're testing:
      # expect(Shirt.all.length).to eq(0)
      adidas = Brand.new("Adidas")
      test_shirt = Shirt.new("yellow", adidas)
      
      # Ok, so now we have our test case: "GIVEN a "
      
      # Then we execute the behavior: "WHEN we call `Shirt.all`...
      # and test the results: "THEN the following should return."
      # In RSpec, the last 2 are wrapped up in an "expect" statement
      expect(Shirt.all.length).to eq(1)
      expect(Shirt.all[0].class == Shirt ).to eq(true)
    end
  end

  # That was fun! Here are another context and two more tests within it, without all the notes to distract your eye.

  context "instance methods" do

    it "has a readable and writable color" do
      expect(shirt.color).to eq("gray")

      shirt.color = "red"
      expect(shirt.color).to eq("red")
    end

    it "has a readable brand" do 

      expect(shirt.brand).to eq(brand)
    end

  end
end