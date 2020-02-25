class Brand
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def shirts
    # there are lots of shirts in Shirt.all
    # not all are mine
    # the ones that ARE have ME as their brand, I need those

    Shirt.all.select { |s| s.brand == self }
  end

  def longest_color
    all_colors = shirts.map(&:color)
    all_colors.max do |color_one, color_two|
      color_one.length <=> color_two.length
    end
  end
end