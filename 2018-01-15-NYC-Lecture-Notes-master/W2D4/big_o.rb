# faker is a gem that generates fake terms
require "faker"
require "byebug"

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def assess
    sleep(0.01)
  end

  def compare(other_cat)
    sleep(0.001)
  end

end

def do_my_job(all_cats)
  all_cats.each { |cat| cat.assess }
  puts "Catssessments complete..."

  all_cats.each_with_index do |cat_1, i|
    all_cats.each_with_index do |cat_2, j|
      # adding the following micro optimization doesn't change overall time complexity of our algorithm
      next if i >= j
      cat_1.compare(cat_2)
      # #include? is O(n), so this loop now is O(n^3)
      # all_cats.include?(cat_2)
    end
  end

  puts "Cats will never love"
end

cats = []

10.times do
  cats << Cat.new(Faker::Name.name)
end

do_my_job(cats)

class Array

  # time complexity of bsearch = O(log n)
  # .... OR IS IT???
  # the implmentation of this method below is not
  # log n as written, its actually O(n) because #take and #drop are linear operations

  def bsearch(nums, target)
    return nil if nums.empty?

    probe_index = nums.length / 2
    case target <=> nums[probe_index]
    when -1
      bsearch(nums.take(probe_index), target)
    when 0
      probe_index
    when 1
      sub_answer = bsearch(nums.drop(probe_index + 1), target)
      (sub_answer.nil?) ? nil : (probe_index + 1) + sub_answer
    end

  end

  # analyzing space complexity
  # how big do the data structures used in our algo grow as input grows






# start and final allow us to specify what part of the array we look at
# without chopping the array in half and creating a new array with each call
# this is actually O(log(n)) :)
def good_bsearch(nums, target, start = 0, final = nums.length)
  debugger
  if (start == final)
    return nil
  end
  probe_offset = (final - start) / 2
  probe_index = probe_offset + start
  case target <=> nums[probe_index]
  when -1
    # end of array becomes probe_index
    good_bsearch(nums, target, start, probe_index)
  when 0
    probe_index
  when 1
    # beginning becomes probe_index + 1
    good_bsearch(nums, target, probe_index + 1, final)
  end

end



# O(nlog(n))
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


























":)"
