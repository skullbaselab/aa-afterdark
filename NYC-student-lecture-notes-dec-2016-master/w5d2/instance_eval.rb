class Dog
  def bark
    puts "woof"
  end

  def eat
    puts "crunch slurp"
  end

  def sleep
    puts "zzzzzz"
  end
end

dog = Dog.new
dog.sleep
dog.eat
dog.bark
dog.eat
dog.eat
dog.sleep
dog.bark
dog.sleep

# Aren't you sick of writing dog. ???
dog.instance_eval do
  # everything in here behaves as if we are writing instanc method inside class Dog
  # implicit self will be instance of dog
  sleep
  eat
  bark
  eat
  eat
end

# helpful when we want to implement the behavior of routes.rb in rails
