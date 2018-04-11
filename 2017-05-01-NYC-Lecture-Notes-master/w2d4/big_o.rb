require "faker"

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
      next if j <= i
      cat_1.compare(cat_2)
    end
  end

  puts "Cats will never love"
end

cats = []

100.times do
  cats << Cat.new(Faker::Name.name)
end

do_my_job(cats)

# O(n log(n)) - time complexity

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

# time complexity of bsearch = O(log n)
# .... OR IS IT???
# the implmentation of this method below is not
# log n as written, its actually O(n)

def bsearch(nums, target)
  return nil if nums.empty?

  probe_index = nums.length / 2
  case target <=> nums[probe_index]
  when -1
    bsearch(nums.take(probe_index), target)
    # Ruby's #take method is O(n) under the hood!
  when 0
    probe_index
  when 1
    sub_answer = bsearch(nums.drop(probe_index + 1), target)
    (sub_answer.nil?) ? nil : (probe_index + 1) + sub_answer
  end

end

# we get around this by not using #take in the version below:
def bsearch(nums, target, start = 0, final = nums.length)
  # nil if not found; can't find K

  probe_offset = (final - start) / 2
  probe_index = probe_offset + start
  if (start == final)
    return nil
  end
  case target <=> nums[probe_index]
  when -1
    bsearch(nums, target, start, probe_index)
  when 0
    probe_index
  when 1
    sub_answer = bsearch(nums, target, probe_index + 1, final)
    (sub_answer.nil?) ? nil : sub_answer
  end

end
