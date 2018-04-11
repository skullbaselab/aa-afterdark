class Dolphin
  def fire_blaster_cannon
    puts "pop pop pop goes the blaster cannon"
  end

  def fire_laser_cannon
    puts "bang bang bang goes the laser cannon"
  end

  def store_in_fin_bay(stuff)
    cargo[:fin] = stuff
  end

  def store_in_aft_bay(cargo)
    cargo[:aft] = cargo
  end

  def set_tail_thruster(pct)
    puts "setting tail thruster to #{pct}"
    @tail_thruster = pct
  end

  def set_head_thruster(pct)
    puts "setting head thruster to #{pct}"
    @head_thruster = pct
  end

  def cargo
    @cargo ||= {}
  end

  def unload_cargo
    stuff = @cargo.keys
    @cargo = {}
    stuff
  end
end

module Shootable
  def mount_cannon(type, sound)
    define_method "fire_#{type}_cannon" do
      noise = [sound] * 3
      puts "#{noise.join(' ')} goes the #{type} cannon"
    end
  end
end

module Cargoable
  def install_cargo_bays(*names)
    names.each do |name|
      define_method "store_in_#{name}_bay" do |stuff|
        cargo[name] = stuff
      end
    end

    define_method :cargo do
      @cargo ||= {}
    end

    define_method :unload_cargo do
      loot = cargo.keys
      @cargo = {}
      loot
    end
  end
end

module Luxury
  def enable_wifi
    @wifi = true
  end
end

class SpaceBase
  extend Cargoable
  extend Shootable
  include Luxury

  def self.attach_thrusters(*thruster_names)
    thruster_names.each do |thruster_name|
      define_method "set_#{thruster_name}_thruster" do |pct|
        puts "setting #{thruster_name} thruster to #{pct}"
        instance_variable_set("@#{thruster_name}_thruster", pct)
      end
    end
  end
end

class Falcon < SpaceBase
  mount_cannon "blaster", "plop"
  mount_cannon "money", "cha-ching"
  install_cargo_bays "lobster", "big"
  attach_thrusters "head", "fore", "aft"
end
