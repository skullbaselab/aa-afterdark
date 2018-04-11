#animals
class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def title
    "#{name} the #{self.class}"
  end
end

module Loud
  LAND_SOUNDS = [
    :roar,
    :quack,
    :stomp,
    :howl
  ]

  WATER_SOUNDS = [
    :sploosh,
    :slurp,
    :gurgle
  ]

  def do_stuff
    sounds.each do |sound|
      5.times do
        puts "#{title} loudly #{sound}s"
      end
    end
  end
end

module Quiet
  def do_stuff
    actions.each do |action|
      puts "#{title} does #{action} quietly"
    end
  end
end

class Duck < Animal
  include Loud

  def sounds
    LAND_SOUNDS + WATER_SOUNDS
  end

end

class Cat < Animal
  include Quiet

  def actions
    ["snuggle", "nap", "sunbathe", "groom"]
  end

  def do_stuff
    puts "no"
  end
end

Duck.new('Mr. Wigglesworth').do_stuff
Cat.new('Garfield').do_stuff
