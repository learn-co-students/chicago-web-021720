class Tweet
  attr_accessor :message, :username
  attr_reader :id
  # @@all = []

  def self.all
    # Go to the tweets table in the database and get all the tweets that there are
    # for each row returned, create one tweet instance with the right @vars
    # and return an array of tweet instances
    # "SELECT * FROM tweets"
    results = DB[:conn].execute("SELECT * FROM tweets;")

    tweets = results.map do |result|
      Tweet.new(result)
    end  
    # binding.pry
    # @@all
  end

  def self.find(id)
    result = DB[:conn].execute("SELECT * FROM tweets WHERE id = ?;", id).first

    if result
      Tweet.new(result)
    else
      nil
    end
  end

  def initialize(attrs={})
    @id = attrs['id']
    @message = attrs['message']
    @username = attrs['username']

    # @@all << self
  end

  def save
    if self.id
      DB[:conn].execute("UPDATE tweets SET username = ?, message = ? WHERE id = ?;", self.username, self.message, self.id)
    else
      DB[:conn].execute("INSERT INTO tweets (message, username) VALUES (?, ?);", self.message, self.username)
      binding.pry
    end
  end
end
