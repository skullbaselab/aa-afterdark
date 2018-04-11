class ATM
  def initialize
    @pins = {
      1111 => "Stephen",
      2222 => "David",
      3333 => "Aaron",
      4321 => "Kelly"
    }
  end

  def add_pin(pin, user)
    @pins[pin] = user
  end

  def sync_pins(other_atm)
    pins.each do |pin|
      if !other_atm.pin_exists?(pin)
        other_atm.add_pin(pin, @pins[pin])
      end
    end
  end

  private

  def pins
    @pins.keys
  end

  protected

  def pin_exists?(pin)
    @pins.include?(pin)
  end

  public

  def users
    @pins.values
  end
end

class Bank < ATM
  # Nothing right now!
end

atm = ATM.new
p atm.methods - Object.methods
