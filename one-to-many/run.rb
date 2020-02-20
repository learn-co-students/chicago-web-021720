require_relative "user.rb"
require_relative "tweet.rb"
require "pry"

coffeedad = User.new("coffeedad")

# p coffeedad.username
# p coffeedad.tweets

coffeedad.post_tweet("love my coffee#")

# p coffeedad.tweets

matchamom = User.new("matchamom")
tweet = Tweet.new("mmmmmatcha", matchamom)
# p tweet.user
# p tweet.username

p matchamom.tweets
