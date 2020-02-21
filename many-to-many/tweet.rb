class Tweet
  attr_reader :message, :user
  @@all = []

  def initialize(message, user)
    @message = message
    @user = user
    @@all << self
  end

  def username
    self.user.username
  end

  def self.all
    @@all
  end

  def likes
    Like.all.select do |like|
      like.tweet == self
    end
  end

  def likers
    # iterate through our likes
    # and get the user who did the liking
    likes.map { |like| like.user }
  end

  def to_s
    <<~TWEET

      -----------------
      #{message}
      posted by: #{username}
      likes: #{likes.count}
      -----------------

    TWEET
  end
end
