class Shirt < ApplicationRecord
  belongs_to :creator, class_name: :User
  validates_presence_of :color, :price
  has_many :sales
  has_many :buyers, through: :sales

  def list_details
    "A nice #{color} shirt declaring \"#{message}\", costing merely #{price}"
  end
end
