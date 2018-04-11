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

class NewCorgus < SpaceBase
  extend Shootable
  extend Cargoable
  attach_thrusters :left, :right, :tail
  install_cannon :drool, :slobber
  install_cannon :fluffy, :fluff
  mount_bays :prt
end