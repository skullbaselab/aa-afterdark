class Breakfast
  attr_accessor :type, :quantity, :temp

  def initialize(type, quantity)
    @type = type
    @quantity = quantity
    @temp = 40
  end

  def cook
    @temp += 200
  end

  def eat(bite_size, hungry_human)
    raise 'Not cooked yet!' unless @temp >= 100
    raise 'Not enough left for that bite size' if bite_size > @quantity

    @quantity -= bite_size
    hungry_human.consume(bite_size)
    "#{hungry_human.name} ate #{bite_size} #{type}s"
  end
end
