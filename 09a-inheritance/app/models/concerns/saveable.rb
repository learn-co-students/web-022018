module Saveable
  module InstanceMethods
    def save
      self.class.all << self
    end
  end

  module ClassMethods
    def all
      self.class_variable_get('@@all')
    end
  end

end
