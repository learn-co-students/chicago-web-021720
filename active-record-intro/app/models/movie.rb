class Movie < ActiveRecord::Base
  has_many :reviews
  # def reviews
  #   Review.where(movie_id: self.id)
  # end
end