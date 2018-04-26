  class LivingThing::Animal
    attr_accessor :name
    # include Saveable::InstanceMethods
    # extend Saveable::ClassMethods

    @@all = []

    def initialize(name)
      @name = name
      # self.save
    end
  end
