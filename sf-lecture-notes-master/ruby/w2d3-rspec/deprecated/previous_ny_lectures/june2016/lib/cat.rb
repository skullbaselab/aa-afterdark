class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def meet_dog(dog)
    if dog.size < 10
      "Hisssss"
    else
      "Scamper"
    end

  end

end

# It would be such a bother to create instances of Dog when I'm testing Cat methods.
# Let's make doubles instead!
class Dog
  attr_reader :height, :weight

  def initialize(name, height, weight, state)
    @name = name
    @height = height
    @weight = weight
    @state = state
    take_to_vet
    chase_tail
  end

  def size
    (height + weight) / 2
  end

  def take_to_vet
    # complicated code!
  end

  def chase_tail
    # complicated code!
  end

  def bark_at_neighbor
    # complicated code!
  end
end
