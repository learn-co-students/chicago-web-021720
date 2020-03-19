class User < ApplicationRecord
  has_many :shirts, foreign_key: :creator_id

  # def shirts
  #   Shirt.where(creator_id: self.id)
  # end
end
