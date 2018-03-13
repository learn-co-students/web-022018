require 'pry'

class Dog
  def initialize(name, breed)
    @name = name
    @breed = breed
  end
end

class SmartDog
  attr_accessor :name, :breed, :age, :gender, :color, :owner, :favorite_toy, :size
  def initialize(attr_hash)
    attr_hash.each do |attr_key, attr_value|
      if self.respond_to?("#{attr_key}=")
        self.send("#{attr_key}=", attr_value)
      end
    end
  end
end

attrs1 = {name: "Rex", breed: "Golden", age: 16, size: "85 lbs", favorite_toy: "tennis ball"}
attrs2 = {name: "Suki", breed: "Black lab", number_of_hydrants_peed_on: 45}

Pry.start
