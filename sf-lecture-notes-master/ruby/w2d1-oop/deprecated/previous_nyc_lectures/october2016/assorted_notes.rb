General OOP
  state and behavior
  law of demeter
  low coupling

expose a limited interface
  - tells others how to use your code
  - allows you to change implementation
  * private
  * private setters
  * protected

inheritance
  - dry
  - maintainable
  - duck typing
  * animal class
  * super, then initialize with different number of arguments
  * class.superclass

Module
 - package for methods (shared functionality)
 - include / extend
 - class.ancestors



------------------------------------

Topics:
Class inheritance and modules
Encapsulation/information hiding
Raising and handling exceptions

write two animal classes
notice the overlap

** inheritance
- keeps code DRY
- generic code and duck typing (method requires us to pass an animal? we can pass any type of animal)

write a generic animal class
- subclasses inherit behavior
- add methods to sub without changing parent
- subclasses can override parent methods
- super (and initializing with different number of instance variables)
- where does Ruby look for methods? -> class.superclass

- constants (put the same constant in parent and child, then use self.class::CONSTANT

add another animal class - 2/3 share methods (single class inheritance)
- include a module (packagine up methods; can't be instantiated)
- child.ancestors

Assorted thoughts about classes
- reopening classes (moneky patching)
- be reasonable - to call Dog#eat probably don't need mouth class, tooth class, stomach class, etc

** information hiding - private and protected

cat.interact(dog) -> dog.fears.include?(cat.name) vs. dog.afraid_of(?cat.name)
- law of demeter - objects should know as little as possible about each other (cat shouldn't know all dogs fears - too much power!)
- uncoupling - changing one shouldn't affect the other (dog.afraid_of might always return false, since dogs never remember anything)

attr_reader for cat.lives, method to age_one_year, but no public attr_writer!
method create_new_identity(new_age) calls private attr_writer

expose limited interface - tells others how to use your code, allows you do change implementation

private - only inside self
protected - only within instance of same class

public_secret, private_secret, protected_secret, reveal_secrets, reveal_friend_secrets(other_cat)

visibility and inheritance

** errors
- raise
- kills program
- begin rescue end (with a debugger)
- errors are objects, and we can make our own!

class MyError < StandardError
end

- begin rescue ensure retry
- rescue specific exceptions
- ensure and retry
- bubbling up of exceptions
