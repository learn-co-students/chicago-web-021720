class User
  attr_reader :username

  def initialize(username = "")
    @username = username.upcase
  end

  # COVERED BY ATTR ACCESSOR ON LINE 2
  # def username
  #   @username
  # end

  def username=(new_name)
    @username = new_name.upcase
  end

  # INPUT(S): string representing tweet message
  # OUTPUT/RETURN: instance of Tweet that was created
  # OTHER/SIDE EFFECTS: in Tweet initialize, new tweet will end up in Tweet.all
  # HOW IT WORKS: Message comes in, gets passed to Tweet.new and also self gets passed in as the user of that tweet
  def post_tweet(message)
    Tweet.new(message, self)
  end

  def tweets
    # From all the tweets that there are,
    # I want the ones I made
    # I am a user, and each tweet belongs to one user,
    # So maybe I can compare myself with the user on the tweet
    # to decide which tweets are mine
    Tweet.all.select do |tweet|
      # self == tweet.user
      tweet.username == self.username
    end
  end

  def like_tweet(tweet)
    Like.new(tweet, self)
  end

  def likes
    Like.all.find_all do |like|
      like.user == self
    end
  end

  def liked_tweets
    # From all the likes, find just mine,
    # then iterate over those likes and pull out the tweet that was liked from each.
    self.likes.collect do |my_like|
      my_like.tweet
    end
  end
end
