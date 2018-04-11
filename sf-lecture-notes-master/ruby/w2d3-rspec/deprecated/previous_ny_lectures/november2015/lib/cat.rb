class Cat

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  # def name
  #   @name
  # end
  #
  # def name=(value)
  #   @name = value
  # end

  def meow
    "meow!"
  end

  def hiss
    "hiss!"
  end

  def encounter_dog(dog)
    if dog.friendly?
      # "meow!"
      meow
    else
      # "hiss!"
      hiss
    end
  end

end