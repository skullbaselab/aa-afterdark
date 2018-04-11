class Cat

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def meow(str)
    str + ' meow'
  end

  def hiss
    raise "invalid input"
  end

  def flee

  end

  def attack

  end

  def encounter_dog(dog)
    if dog.size > 9000
      self.flee
    else
      self.attack
    end
  end

  # def name
  #   @name
  # end
  #
  # def name=(name)
  #   @name = name
  # end

end
