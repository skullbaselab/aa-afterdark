require "faker"
class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def assess
    @score = rand(10)
    sleep(0.01)
  end

  def compare(other_cat)
    sleep(0.001)
  end

end

def do_my_job(all_cats)
  all_cats.each { |cat| cat.assess }
  # looping once over the input -> n
  puts "Catssessments complete..."

  all_cats.each do |cat_1|
    # looping once over the input -> n
    all_cats.each do |cat_2|
      # looping a second time over the same input, inside the n loop -> n^2
      cat_1.compare(cat_2)
    end
  end

  puts "Cats will never love"
end

cats = []
# 2 cats
  # .02 + .004

# 5 cats
 # .05 + .025

# 10 cats
  # .1 + .1

# 32 cats
  # .32 + 1.024

# 100 cats
  # 1 + 10

 # 5, 10, 32, 100
100.times do
  cats << Cat.new(Faker::Name.name)
end

do_my_job(cats) # O(n^2)
# big O is about how runtime grows


# BSearch
  # sorted array
  # compare middle to target
  # bsearch on one side or the other

  # O(log n)
  # At each step we cut the problem in half


class Array
  def merge_sort
    return self if count < 2

    middle = count / 2

    left, right = self.take(middle), self.drop(middle)
    sorted_left, sorted_right = left.merge_sort, right.merge_sort

    merge(sorted_left, sorted_right)
  end

  def merge(left, right)
    merged_array = []
    until left.empty? || right.empty?
      merged_array <<
        ((left.first < right.first) ? left.shift : right.shift)
    end

    merged_array + left + right
  end
end

# mergesort
  # O(n log n)

  # merging requires n comparisons
  # log n -> splitting the array in half at each stage
  # we have to do n comparisons log n times
