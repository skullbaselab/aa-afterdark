# Every spaceship has 3 attributes:
# - Cargo bay
# - Thrusters
# - Cannons

class Spaceship

  # def store_in_location(stuff)
  #   @cargo[location] stuff
  # end
end

module Cargo
    define_method(:cargo) do
    @cargo ||= {}
  end

  define_method(:unload_cargo) do
    loot = @cargo.values
    @cargo = {}
    loot
  end

  def self.install_bay(*locations)
    locations.each do |location|
      define_method("store_in_#{location}") do |stuff|
        @cargo[location] = stuff
      end
    end
  end

  install_bay("main")
end

module Thrusters
  def self.install_thrusters(*types)
    types.each do |type|
      instance_variable_set("@#{type}", [])
      define_method("set_#{type}_thruster_to") do |level|
        instance_variable_get("@#{type}")[0] = level
      end
      define_method("current_#{type}_thruster_level") do
        instance_variable_get("@{type}")[0]
      end
    end
  end
end

      


class BigShip < Spaceship
  extend Cargo
  extend Thrusters
  install_bay("starboard", "port")
  install_thrusters("nuclear", "photon")
end

