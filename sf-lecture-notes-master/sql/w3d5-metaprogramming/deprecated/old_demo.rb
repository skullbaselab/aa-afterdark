class Corgus
  def set_left_thruster(percent)
    puts "setting left thruster to #{percent}%"
    @left_thruster = percent
  end

  def set_right_thruster(percent)
    puts "setting right thruster to #{percent}%"
    @right_thruster = percent
  end

  def fire_furry_cannons
    puts "fluff fluff fluff goes the furry cannons"
  end

  def fire_drool_cannons
    puts "slobber slobber slobber goes the drool cannons"
  end

  def cargo
    @cargo ||= {}
  end

  def store_in_starboard_bay(stuff)
    cargo[:starboard] = stuff
  end

  def store_in_port_bay(stuff)
    cargo[:port] = stuff
  end

  def unload_cargo
    loot = cargo.values
    @cargo = {}
    loot
  end
end

class SpaceBase
  def self.attach_thrusters(*types)
    types.each do |type|
      define_method "set_#{type}_thruster" do |percent = 42|
        puts "setting #{type} thruster to #{percent}%"
        instance_variable_set("@#{type}_thruster", percent)
      end
    end
  end
end

module Cargoable
  def mount_bays(*types)
    types.each do |type|
      define_method "store_in_#{type}_bay" do |stuff|
        cargo[type] = stuff
      end
    end

    define_method :cargo do
      @cargo ||= {}
    end

    define_method :unload_cargo do
      loot = cargo.values
      @cargo = {}
      loot
    end
  end
end

module Shootable
  def install_cannon(type, sound)
    define_method "fire_#{type}_cannon" do
      puts "#{sound} #{sound} #{sound} goes the #{type} cannon"
    end
  end
end

module Luxury
  def enable_wifi
    @wifi = true
  end
end

class SpaceFighter < SpaceBase
  extend Shootable
end

class SpaceCargo < SpaceBase
  extend Cargoable
  include Luxury
end



class CorgusFighter < SpaceFighter
  install_cannon :drool, :slobber
  install_cannon :fluffy, :fluff
  attach_thrusters :left, :right, :tail
end

class CorgusCargo < SpaceCargo
  attach_thrusters :left, :right, :tail
  mount_bays :prt
end
