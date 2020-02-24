require_relative "twitter_content"
require_relative "tweet"
require_relative "bio"
require_relative "user"

p user = User.new("coffeedad")

p bio = Bio.new({user: user, message: "loves coffee, and revenge"})

p Tweet.new(message: "coffee", user: user)

bio.inherited!
Bio.class_try
