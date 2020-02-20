class User
  attr_reader :username

  def initialize(username)
    @username = username.upcase
  end

  # COVERED BY ATTR ACCESSOR ON LINE 2
  # def username
  #   @username
  # end

  def username=(new_name)
    @username = new_name.upcase
  end

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
end
