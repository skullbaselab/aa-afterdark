class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def meow
  end

  def dare(dog)
    meow
    if dog.size < 20
      attack
    else
      flee
    end
  end

  def attack
  end

  def flee
  end
end
