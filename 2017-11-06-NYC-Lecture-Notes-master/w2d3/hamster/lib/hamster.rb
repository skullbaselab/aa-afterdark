class Hamster
  attr_reader :name, :strength


  def initialize(name, strength)
    @name = name
    @strength = strength
  end

  def eat_carrot
    self.strength += 1
  end

  def swole?
    self.strength > 10
  end

  def climb_stairs
    raise WeakError unless self.swole?
  end

  def fight

  end

  def encounter_bird(bird)
    if bird.type == 'pigeon'
      fight
    elsif bird.type == 'hawk'
      run
    end
  end

  def run

  end

  private
  attr_writer :strength
end


class WeakError < StandardError
end
