require_relative "user.rb"
require_relative "tweet.rb"
require_relative "like.rb"
require "pry"

coffeedad = User.new("coffeedad")

# p coffeedad.username
# p coffeedad.tweets

coffeedad.post_tweet("love my coffee#")

# p coffeedad.tweets

matchamom = User.new("matchamom")
matcha_tweet = Tweet.new("mmmmmatcha", matchamom)
# p tweet.user
# p tweet.username

# p matchamom.tweets

coffeedad.like_tweet(matcha_tweet)
p matcha_tweet.likers
# p matchamom.liked_tweets
# p coffeedad.liked_tweets

# binding.pry

puts "Let's tweet! Who are you?"

user = User.new(gets.chomp)

puts "Tweet something!"

user.post_tweet(gets.chomp)

puts "Great! Here is the curret feed:"

puts Tweet.all
