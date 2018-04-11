class Stack

  def initialize
    @underlying_array = []
  end

  def push(el)
    underlying_array.push(el)
    # Could also do this:
    # underlying_array.unshift(el)
    el
  end

  def pop
    underlying_array.pop
    # Could also do this:
    # underlying_array.shift
  end

  def peek
    underlying_array.last
    # Would need to do:
    #   underlying_array.first
    # to account for the above alternatives.
  end

  def count
    underlying_array.length
  end

  private

  attr_reader :underlying_array

  # # This is what attr_reader does:
  # def underlying_array
  #   @underlying_array
  # end
  #
  # # This is what attr_writer does:
  # def underlying_array=(arg)
  #   @underlying_array = arg
  # end
  #
  # # Together they make up attr_accessor

end
