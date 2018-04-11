# Byebug

+ **Should be run as a code demo in the lecture area**
  + Tends to be a key point of confusion for students - this station is historically popular.

```ruby
require 'byebug'

# helpful to explain why using byebug is important to know
# how byebug will work going through multiple functions => if there are functions being called inside other functions
# dont forget to call the function at the end so that when you run ruby filename.rb it hops into the function


# different byebug keywords to cover:
# step /s
# next /n
  # how it will go over an entire method call like an each loop
# display /undisplay
# list=
# where

# being able to use byebug and debugger as a breakpoint keyword in code



def foo(dog, toy)
  total = 0
  dog
  toy

  play = "The" + dog + "plays with " + toy
  p play

  dog = "puppy"
  toy = "carrot"
  play = "The" + dog + "plays with " + toy
  p play

  [1,2,3,4].each do |num|
    total += num
  end

  dog = "cat"
  toy = "string"
  play = "The" + dog + "plays with " + toy
  p play
end


foo("corgie", "ball")
```