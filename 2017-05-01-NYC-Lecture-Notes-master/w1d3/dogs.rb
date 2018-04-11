class Dog
  def initialize(name)
    @name = name
  end
  
  attr_reader :name

  def say_name
    "#{name}, woof"
  end
end

class Owner
  def initialize(pet)
    @pet = pet
  end
  attr_reader :pet
  def make_pet_say_name
    self.pet.say_name
  end
end

class MagicOwner
  def initialize(pet_name)
    @pet = Dog.new(pet_name)
  end
end
