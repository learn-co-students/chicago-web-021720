require_relative 'spec_helper.rb'

describe Cat do

  let(:cat) { Cat.new("crookshanks") }

  it "can initialize a cat" do
    expect(cat).to be_a(Cat)
  end

  it "initializes with a name" do
    expect(cat.name).to eq("crookshanks")
  end

  it "can't change its name" do
    expect { cat.name = "mr. whiskers" }.to raise_error
  end

  it "initializes with an oopsie mood" do
    expect(cat.mood).to eq("oopsie")
  end

  it "can change its mood" do
    cat.mood = "playful"
    expect(cat.mood).to eq("playful")
  end

  it "has virality that can change" do
    expect(cat.virality).to eq(9)
    cat.virality = 5
    expect(cat.virality).to eq(5)
  end

end
