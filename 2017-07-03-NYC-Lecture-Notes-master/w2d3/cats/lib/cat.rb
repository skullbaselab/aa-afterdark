require 'byebug'

class Cat

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def meow(string)
    "meow #{string}"
  end

  def encounter_dog(dog)

    if dog.size == "BIG"
      flee
    else
      attack(dog)
    end

  end

  def hiss
    raise "Hisss!!!!"

  end

  def cat_block(&block)
    # debugger
    # tester beware! block provided by rspec when called returns nil!
    block.call

  end


  private

  def flee

  end

  def attack(dog)

  end



  # def name
  #   @name
  # end
  #
  # def name=(name)
  #   @name = name
  # end

end
