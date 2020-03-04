class Movie < ActiveRecord::Base
  has_many :reviews
  has_many :reviewers, through: :reviews

  # def reviews
  #   Review.where(movie_id: self.id)
  # end
end