## Guess the order!

class Array

  #O(n)
  def my_map(&prc)
    mapping = []

    self.each do |el|
      mapping << prc.call(el)
      #assuming prc is O(1)
    end

    mapping
  end

  #O(n^2)
  def intersection(other)
    intersection = []

    self.each do |el|
      intersection << el if other.include?(el)
      #assuming other is an array
    end

    intersection
  end

  @@b_searches = 0

  def b_search_meta(target)
    @@b_searches = 0

    result = b_search(target)

    puts "#b_search called #{@@b_searches} times for size #{self.size} input."
    puts "log(#{self.size}) = #{Math.log(self.size, 2)}"
    @@b_searches = 0

    result
  end

  def b_search(target)
    @@b_searches += 1

    return nil if self.empty?

    midpt = self.length / 2

    case target <=> self[midpt]
    when -1
      self.take(midpt).b_search(target)
    when 0
     midpt
    when 1
      result = self.drop(midpt + 1).b_search(target)

      result.nil? ? result : midpt + 1 + result
    end

  end

end

#O(2^n)?
def domination(n)

  n + 5

  n.times.inject(:+)

  n.times do |k|
    k * (n.times.inject(:+))
  end

  double_me = ['o']
  n.times do
    double_me = double_me.inject([]) do |acc, el|
      acc + [el, el]
    end
    # the last call to inject is 2^n operations because double_me will
    # be of length 2^n
  end

  double_me.length
end

class Array

  @@mergesorts = 0

  def mergesort_meta
    sorted = self.mergesort

    puts "#mergesort called #{@@mergesorts} times for size #{self.size} input."
    puts "#{self.size} * log(#{self.size}) = #{self.size * Math.log(self.size, 2)}"

    @@mergesorts = 0

    sorted
  end

  def mergesort
    @@mergesorts += 1

    return self if self.length < 2

    left, right = split #O(n)

    Array.merge(left.mergesort, right.mergesort) #O(n * logn)
  end
  #make logn calls, each of which does n operations

  private

  def split
    midpt = self.length / 2

    [self.take(midpt), self.drop(midpt)]
  end

  def self.merge(arr1, arr2) #O(n)
    merged = []

    until arr1.empty? || arr2.empty?
      merged << (arr1.first < arr2.first ? arr1.shift : arr2.shift)
    end

    merged + arr1 + arr2
  end

end

if __FILE__ == $PROGRAM_NAME
  puts "...loading #{__FILE__}"
  require 'pry'
  pry
end
