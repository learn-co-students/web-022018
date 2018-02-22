require 'pry'

class Dog
  attr_accessor :name, :breed, :owner

  @@all = []

  def initialize(name, breed, owner="Prince")
    @name = name
    @breed = breed
    @owner = owner

    @@all << self
  end

  def bark
    puts "#{@name} the #{@breed} goes and barks."
  end

  def self.all
    @@all
  end

  # Setters/Getters by hand, better to use attr_accessor
  # def name=(name)
  #   @name = name
  # end
  #
  # def name
  #   @name
  # end
  #
  # def breed=(breed)
  #   @breed = breed
  # end
  #
  # def breed
  #   @breed
  # end
end

binding.pry
