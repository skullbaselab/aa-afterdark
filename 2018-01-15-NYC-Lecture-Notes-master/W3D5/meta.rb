# SCOPE
require 'byebug'

class Pet

  def self.teach_tricks(*trick_names)
    trick_names.each do |trick_name|
      define_method(trick_name) do
        puts "#{trick_name}ing"
      end
    end
  end

end

class Dog < Pet
  puts self

  def self.doggie_things
    puts self
  end

  def who_am_i?
    puts self
  end

  def initialize(name)
    @name = name
    @secret = "Cat in disguise"
  end

  # teach_tricks(:sleep, :eat, :drink, :bark)


  method_names = [:sleep, :eat, :drink, :walk]

  method_names.each do |name|
    define_method(name) do |num_times, enthusiastic|
      string = "#{name}ing" * num_times
      string += "!" if enthusiastic
      puts string
    end
  end

  def method_missing(method_name, *args)
    self.class.send(:define_method, method_name) do |*args|
      puts "#{method_name}ing"
    end
    self.send(method_name)
    # puts "called #{method_name}"
    # p args
    # puts
  end

  # def sleep
  #   puts "sleeping"
  # end
  #
  # def eat
  #   puts "eating"
  # end
  #
  # def drink
  #   puts "drinking"
  # end

  def trick
    puts "BACK FLIP!!"
  end

  private

  # attr_reader :secret

  # def tell_secret
  #   puts "My secret is: #{@secret}"
  # end

  def juggle(num_pins)
    puts "juggling #{num_pins} pins"
  end

  def supertrick(&prc)
    puts "Powering up for supertrick!!!"
    puts "..."
    puts "..."
    prc.call
  end
end


class Fish < Pet

  teach_tricks :swim, :fetch, :jump, :be_boring

  def initialize(name)
    @name = name
  end


end
