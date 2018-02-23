class User
  attr_accessor :username

  def initialize(username)
    @username = username
    # @tweets = []
  end

  # def username
  #   @username
  # end
  #
  # def username=(username)
  #   @username = username
  # end

  def tweets
    #returns an array of tweet instances for a user
    # Tweet.all.select {|tweet| tweet.username == username}
    Tweet.all.select {|tweet| tweet.user == self}
  end

  def post_tweet(message)
    #take a message, create a tweet, add it to the user
    # tweet = Tweet.new
    # @tweets << tweet
    Tweet.new(message, self)
  end

end
