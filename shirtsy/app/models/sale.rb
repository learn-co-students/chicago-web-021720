class Sale < ApplicationRecord
  belongs_to :shirt
  belongs_to :buyer, class_name: :User
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }

  def list_display
    # A sale made by someone to some buyer. 
    # the # of color shirts in the order made the total 
    shirt_word = quantity == 1 ? "shirt" : "shirts"
    "#{self.shirt.creator_name} sold #{self.quantity} #{self.shirt.color} #{shirt_word} to #{self.buyer.name}.
    With a unit price of #{self.shirt.price}, the total for the sale was #{self.total}."
  end

  def total
    self.quantity * self.shirt.price
  end
end
