class Sale < ApplicationRecord
  belongs_to :shirt
  belongs_to :buyer, class_name: :User
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
end
