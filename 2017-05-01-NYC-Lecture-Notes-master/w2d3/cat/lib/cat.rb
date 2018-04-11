class Cat

  attr_accessor :name

  def initialize(name)
    @name = name
  end
  #
  # def name
  #   @name
  # end
  #
  # def name=(name)
  #   @name = name
  # end

  def meow
    "meowww"
  end

  def hiss
    "hisss"
  end


  def encounter_dog(dog)
    if dog.size < 9000
      attack
    else
      flee
    end
  end

  private

  def attack
  end

  def flee
  end

end
