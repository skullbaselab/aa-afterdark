class HamsterErrors < StandardError; end
class WeakSauceError < HamsterErrors; end

class Hamster

  attr_reader :strength, :name

  def initialize(name, strength)
    @name = name
    @strength = strength
  end

  # def name
  #   @name
  # end
  #
  # def strength
  #   @strength
  # end

  def eat_carrot
    # strength = strength + 1
    self.strength += 1
  end

  def swole?
    strength > 10
  end

  def climb_stairs
    raise WeakSauceError unless self.swole?
  end

  def encounter_bird(bird)

    if bird.type == "hawk"
      run
    else
      fight
    end
  end

  private

  attr_writer :strength

  def fight; end
  def run; end

  # def strength=(str)
  #   @strength = str
  # end

end






















#end
