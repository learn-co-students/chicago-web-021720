#!/usr/bin/env ruby
require_relative '../config/environment'


# tweet = Tweet.new({'username' => "dad jr", 'message' => "cold brew is the best"})
# p tweet
# tweet.save


# p Tweet.all
# p Tweet.all.include?(tweet)

found_tweet = Tweet.find(10)

found_tweet.message = "All out of COFFEE! NOT!"

found_tweet.save

p Tweet.all
# p Tweet.find(2)
# TweetsApp.new.call
binding.pry
