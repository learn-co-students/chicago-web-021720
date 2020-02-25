require_relative '../brand'
require_relative '../shirt'


describe "Brand" do
  before(:each) do
    @nike = Brand.new("Nike")
    @fitch = Brand.new("Fitch")
    @shirt_one = Shirt.new("black", @fitch)
    @shirt_two = Shirt.new("turquoise", @fitch)
    @shirt_three = Shirt.new("red", @nike)
  end

  context "instance methods" do
    it "has a readable and writable name" do
      brand = Brand.new("Element")

      expect(brand.name).to eq("Element")

      brand.name = "Zero"
      expect(brand.name).to eq("Zero")
    end

    it "has a readable list of shirts made under the brand" do
       

      expect(@fitch.shirts).to eq([@shirt_one, @shirt_two])

    end

    it "can tell you the longest color name associated with one of its shirts" do
      expect(@fitch.longest_color).to eq("turquoise")
    end
  end
end