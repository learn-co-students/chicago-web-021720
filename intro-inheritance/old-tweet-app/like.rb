class Like
  attr_reader :tweet, :user

  @@all = []

  def initialize(tweet, user)
    @tweet = tweet
    @user = user
    @@all << self
  end

  def self.all
    @@all
  end

  # def tweet_message
  #   self.tweet.message
  # end
  #
  # def username
  #   self.user.username
  # end
end
