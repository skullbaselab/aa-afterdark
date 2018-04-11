require 'rubygems'
require 'active_support/inflector'

class Errors
  
  def bad_thing_error
    raise "BadThingError"
  end
  
  def more_bad_things_error
    raise "MoreBadThingsError"
  end
  
  def the_baddest_of_things_error
    raise "TheBaddestOfThingsError"
  end
  
  private
  
  def dont_call_me_plz
    # For demonstrating <object>.send
    puts "oh no"
  end
  
end

class MetaErrors
  ERRORS = [
    "BadThing",
    "MoreBadThings",
    "TheBaddestOfThings"
  ]
  
  def self.define_errors
    ERRORS.each do |error|
      define_method(error.underscore + "_error") do
        raise error + "Error"
      end
    end
  end
  
  define_errors
end

meta = MetaErrors.new
p meta.methods - Object.methods

# meta.bad_thing_error

# Demo #send
# errors = Errors.new
# errors.send(:dont_call_me_plz)