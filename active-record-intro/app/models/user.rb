class User < ActiveRecord::Base
  has_many :reviews, foreign_key: "reviewer_id"
  has_many :reviewed_movies, through: :reviews, source: :movie

  # def reviews
  #   Review.where(reviewer_id: id)
  # end

  # def reviewed_movies
  #   self.reviews.map do |review|
  #     Movie.find(review.movie_id)
  #   end
  # end
end