class Tweet
  attr_accessor :message
  attr_reader :user

  @@all = []

  def initialize(message, user)
    @message = message
    @user = user
    @@all << self
  end

  def self.all
    @@all
  end

end
