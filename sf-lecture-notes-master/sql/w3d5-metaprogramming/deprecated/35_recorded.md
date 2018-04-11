# Week 3 Day 5 : Meta Programming

NB: You want to minimize the amount of raw SQL that you write because it makes it easier to switch production databases in the future.

```ruby
class Condor
  def set_flapping_thruster val
    puts "setting flapping thruster to #{val}%"
    @flapping_thruster = val
  end

  def store_in_stinky_bay cargo
    self.cargo[:stinky] = cargo
  end

  def store_in_double_wide_bay cargo
    self.cargo[:double_wide] = cargo
  end

  def unload
    stuff = self.cargo.values
    @cargo = {}
    stuff
  end

  def fire_colt_45
    puts "bang goes the colt 45"
  end

  def fire_laser_cannon
    puts "pew pew goes the laser cannon"
  end

  def cargo
    @cargo ||= {}
  end
end

c = Condor.new
c.store_in_stinky_bay('onions')
c.store_in_double_wide_bay('prisoners')
c.set_flapping_thrusters(75)
c.fire_colt_45
c.fire_colt_45
c.fire_colt_45
c.fire_laser_cannon
c.set_flapping_thrusters(0)
c.unload
```

Now let's DRY our code and use `define_method`

```ruby
class Condor
  def set_flapping_thruster val
    puts "setting flapping thruster to #{val}%"
    @flapping_thruster = val
  end

  def store_in_stinky_bay cargo
    self.cargo[:stinky] = cargo
  end

  def store_in_double_wide_bay cargo
    self.cargo[:double_wide] = cargo
  end

  def unload
    stuff = self.cargo.values
    @cargo = {}
    stuff
  end

  def fire_colt_45
    puts "bang bang goes the colt 45"
  end

  def fire_laser_cannon
    puts "pew pew goes the laser cannon"
  end

  def cargo
    if @cargo.nil?
      @cargo = {}
    end
    @cargo
  end
end

class SpaceBase
  def self.mount_thruster(name)
    define_method("set_#{name}_thruster") do |val|
      puts "setting #{name} thruster to #{val}%"
      instance_variable_set("@#{name}_thruster", val)
    end
  end

  def self.attach_cargo_bays(*names)
    names.each do |name|
      defien_method("store_in_#{name}_bay") do |cargo|
        self.cargo[name] = cargo
      end
    end
  end

  def self.build_gun(name, sound)
    define_method("fire_#{name}") do
      puts "#{sound} #{sound} goes the #{name}"
    end
  end

  def unload
    stuff = self.cargo.values
    @cagro = {}
    stuff
  end

  def cargo
    @cargo ||= {}
  end
end

class Sparrow < SpaceBase
  mount_thruster :ion
  attach_cargo_bays :smuggler, :fancy, :green
  build_gun "whirlwind_cannon", "whoosh"
  build_gun "super_soaker", "sploosh"
end

s = Sparrow.new
s.set_ion_thruster(55)
s.store_in_green_bay("cheese")
s.store_in_smuggler_bay("rum")
s.store_in_fancy_bay("spice")
s.unload
s
s.fire_whirlwind_cannon
s.fire_super_soaker
```


Let's make the base class customizable

```ruby
module Shootable
  def build_gun(name, sound)
    define_method("fire_#{name}") do
      puts "#{sound} #{sound} goes the #{name}"
    end
  end
end

module Cargoable  
  def attach_cargo_bays(*names)
    names.each do |name|
      defien_method("store_in_#{name}_bay") do |cargo|
        self.cargo[name] = cargo
      end
    end

    define_method(:cargo)
      @cargo ||= {}
    end

    define_method(:unload)
      stuff = self.cargo.values
      @cagro = {}
      stuff
    end
  end
end

module Aux
  def activate_windshield_wiper
    puts "splish splash"
  end

  def activate_stereo
    puts "bumpin' these jamps"
  end
end

class SpaceBase
  include Aux

  def self.mount_thruster(name)
    define_method("set_#{name}_thruster") do |val|
      puts "setting #{name} thruster to #{val}%"
      instance_variable_set("@#{name}_thruster", val)
    end
  end
end

class VelinasFirefly < SpaceBase
  extend Shootable

  mount_thruster :big_bird
  build_gun "cluster_torpedo", "boom"
end

class Bird < VelinaFirefly
  # can install methods
end
```
