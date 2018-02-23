require 'pry'
require_relative './tweet'
require_relative './user'


coffee_dad = User.new("coffee_dad")
tea_uncle = User.new("tea_uncle")

tweet1 = Tweet.new("great coffee", coffee_dad)
tweet2 = Tweet.new("mmm cuppa joe", coffee_dad)
tweet3 = Tweet.new("ooooo oolong", tea_uncle)
tweet4 = Tweet.new("peppermint so wintry", tea_uncle)


Pry.start
