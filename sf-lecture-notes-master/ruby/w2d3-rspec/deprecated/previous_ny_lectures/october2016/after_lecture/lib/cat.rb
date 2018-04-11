class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def meow
    'mrrwww'
  end

  def hiss
    'hisss'
  end

  def encounter_dog(dog)
    dog.bark
    
    if dog.friendly?
      meow
    else
      hiss
    end
  end

  # def name
  #   @name
  # end
  #
  # def name=(new_name)
  #   @name = new_name
  # end
end
