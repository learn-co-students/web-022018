class Bird < Vertebrate
  include Flyable::InstanceFly
  extend Flyable::ClassFly

end
