class TooStrongError < ArgumentError
end
class WTFIsThatError < ArgumentError
end

class Warrior
  attr_reader :name
  def initialize name, power_level
    @name = name
    @power_level = power_level
    @health = 100
  end

  def battle other_warrior
    begin
      self.attack other_warrior
      puts "THE BATTLE IS OVER"
    rescue TooStrongError => e
      puts e.message
      self.wound 10
    rescue WTFIsThatError => wtf_error
      puts "MUST BE A WARRIOR, CMON"
      self.wound 5
    ensure
      puts "But life goes on!"
    end
  end


  def attack other_warrior
    # raise WTFIsThatError.new "warrior, plz" unless other_warrior.is_a? Warrior
    raise
    if other_warrior.power_level > power_level
      raise TooStrongError.new "Do you even lift, #{name}?"
    end

    other_warrior.wound 20
  end

  def wound amt
    @health -= amt
    puts "OUCH, I, #{@name} have only #{@health} remaining!"
  end

  protected
  attr_reader :power_level
end

class Saiyan < Warrior
  def initialize name, power_level, tail_color
    super name, power_level
    @tail_color = tail_color
  end

  def become_super
    @power_level *= 100
    puts "My tail has become even #{@tail_color}er!"
  end
end
