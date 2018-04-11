## Active Record Lite
### Topics
* send, both with and without args
* `define_method`
* `instance_variables`
* `instance_variable_get`
* `instance_variable_set`
* class instance variables
* class variables, shared between parent and sub classes
* self, self.class, WHO AM I?
* extend v include modules

### Project Advice
* run certain spec with line number
* do not use `attr_accessor` past phase 0, just to practice define method
* symbolize strings, come out of hash as strings
* follow directions, don't skip ahead
* do NOT use active record base, not a rails project
* store the data in a hash for all properties, NOT individual instance vars
* you can string interpolate into heredocs
* Constantize
* scope when in a method created using `define_method`

## Demo
* concept: spaceships
* make a spaceship class
* turn it into a module and include
* store cargo in hash, use a getter method that memoizes
* `set_thruster_name` sets ivar and prints value
* `fire_cannon_name` prints name and makes sound
* fire all cannons
* each have a couple cargo bays, thrusters, and cannons
* make an `install_cannon` class method takes type and noise
* also defines fire all cannons which uses send
* make a construct thruster that takes type, and inside takes a value
* make a build bays method, takes list of bays, makes inventory and setters
* also unload cargo
* move methods into modules to be extended and included
* motto, as class instance variable
* add a self.fleet which returns a memoized array
* initialize `<<` self into fleet
* at end, review who is self and where
