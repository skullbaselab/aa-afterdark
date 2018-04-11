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
    puts "fluff fluff fluff goes the furry cannon"
  end

  def fire_drool_cannons
    puts "slobber slobber slobber goes the drool cannon"
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

