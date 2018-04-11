require 'byebug'

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def meow
    "mrrwwww"
  end

  def hiss
    "hisss"
  end

  def encounter_dog(dog)
    if dog.friendly?
      meow
    else
      hiss
    end
  end
end
