class Invertebrate < LivingThing::Animal
  attr_accessor :name

  @@all = []

  def initialize(name)
    super(name)
    @name = name
  end

  def fly
    "Yeah, not so much..."
  end
end
