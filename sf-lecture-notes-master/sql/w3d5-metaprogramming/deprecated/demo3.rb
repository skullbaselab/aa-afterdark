=begin
###### OLD WAY ######
load 'corgus.new'
c = Corgus.new
c.methods - Object.methods


###### NEW WAY ######
load 'generic.rb'
nc = NewCorgus.new
nc.methods - Object.methods

NewCorgus.attach_thrusters "middle"
nc.set_middle_thruster(90)

Corgus.mount_bays "snax"
nc.store_in_snax_bay "milkbones!"
nc.cargo # {"snax"=>"milkbones!"}

Corgus.install_cannon(:steph_curry, "swish")
nc.fire_steph_curry_cannon

=end


### WRITE THIS LIVE
# class Spaceship
#   def self.install_cannon name, effects
#     define_method "fire_#{name}_cannon" do
#       puts "#{effects} #{effects} #{effects} goes the #{name} cannon"
#     end
#   end

#   def self.mount_bays
#   end

#   def self.attach_thrusters
#   end
# end





















###### ONE-CLASS DEMO ######
# class Spaceship
#   def self.install_thrusters(*thrusters)
#     thrusters.each do |thruster|
#       define_method("set_#{thruster}_thruster") do |level|
#         puts "setting #{type} thruster to #{level}%"
#         instance_variable_set("@#{thruster}_thruster", level)
#       end
#     end
#   end

#   def self.mount_bays(*bays)
#     bays.each do |bay|
#       define_method("store_in_#{bay}_bay") do |stuff|
#         cargo[bay] = stuff
#       end
#     end

#     define_method :cargo do
#       @cargo ||= {}
#     end

#     define_method :unload_cargo do
#       loot = cargo.values
#       @cargo = {}
#       loot
#     end
#   end
  
#   def self.install_cannons(type, sound)
#     define_method(type) do
#       puts "#{sound} #{sound} #{sound} goes the #{type} cannon"
#     end
#   end
# end

# =begin
###### FULL DEMO ######
module Rockets
  def attach_thrusters thruster_name
    define_method "set_#{thruster_name}_thruster" do |percent = 42|
      puts "setting #{thruster_name} thruster to #{percent}%"
      instance_variable_set "@#{thruster_name}_thruster", percent
    end
  end
end

module Cargo
  def mount_bays bay_name
    define_method "cargo" do 
      @cargo ||= {}
    end

    define_method "store_in_#{bay_name}_bay" do |bay_cargo|
      puts "storing #{bay_cargo} in #{bay_name}"
      cargo[bay_name] = bay_cargo
    end

    define_method "unload_cargo" do
      loot = cargo.values
      @cargo = {}
      loot
    end
  end
end

module Cannon
  def install_cannon cannon_name, cannon_sound
    define_method "fire_#{cannon_name}_cannon" do
      puts "the #{cannon_name} cannon goes #{cannon_sound} #{cannon_sound} #{cannon_sound}"
    end
  end
end

class Spaceship
  extend Rockets
  extend Cargo
  extend Cannon
end

# class Platypus < Spaceship
#   has_many :eggs
#   belongs_to :my_friend_list
# end

class NewCorgus < Spaceship
  attach_thrusters "left_paw"
  attach_thrusters "right_paw"
  mount_bays "snax"
  install_cannon "fluff", "fluff"
  install_cannon "drool", ":P"
end