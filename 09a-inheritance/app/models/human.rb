class Human < Mammal
  attr_accessor :name

  include Swimmable

  @@all = []

  # can humans fly?
end
