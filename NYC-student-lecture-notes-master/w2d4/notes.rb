# ** Big O! **

def iter_search(arr, target)
  arr.each_with_index do |el, idx|
    return idx if el == target
  end
  nil
end
# What be the time complexity? O(n) aka linear

def substrings(str)
  subs = []

  (0...str.length).each do |idx1|
    # micro optimization - only reduces computation by constant time
    (idx1...str.length).each do |idx2|
      subs << str[idx1, idx2]
    end
  end

  subs
end
# What be the time complexity? O(n^2) aka quadratic

def perms_and_sort(arr)
  permutations = arr.permutation.to_a
  # what is the length of 'permutations'? n!
  # what is the length of 'perm'? n
  # what is the time complexity of 'sort'? O(n * logn)
  permutations.map { |perm| perm.sort }
end
# What be the time complexity? O(n! + n! * nlog(n)) => O(n! * log(n))s


# Cats love OKCatpid
def cat_matchmaking(num_cats)
  start = Time.now
  cats_scores = (1..num_cats).map do |cat|
    sleep(0.1) # cat psychologist doing their thing!
    rand(5) + 1
  end

  puts "scoring took #{Time.now - start} seconds for #{num_cats} cats"

  start = Time.now

  cats_scores[0..-2].each_with_index do |score1, idx1|
    cats_scores[(idx1 + 1)..-1].each_with_index do |score2, idx2|
      sleep(0.001) # much faster comparison!
      score1 <=> score2
    end
  end

  puts "comparing took #{Time.now - start} seconds for #{num_cats} cats"
end


class Array

  def bsearch(target)
    @@bsearch_count += 1
    return nil if self.empty?

    middle = self.length / 2

    if self[middle] > target
      self[0...middle].bsearch(target)
    elsif self[middle] < target
      right_result = self[middle + 1...self.length].bsearch(target)
      right_result.nil? ? nil : right_result + middle + 1
    else
      middle
    end
  end

  def merge_sort
    @@merge_sort_count += 1
    return self if self.length <= 1

    middle = self.length / 2
    left = self.take(middle)
    right = self.drop(middle)

    Array.merge(left.merge_sort, right.merge_sort)
  end

  def self.merge(left, right)
    sorted = []

    until left.empty? || right.empty?
      sorted << (left.first < right.first ? left.shift : right.shift)
    end

    sorted + left + right
  end

  @@bsearch_count = 0

  @@merge_sort_count = 0

  def self.bsearch_count
    @@bsearch_count
  end

  def self.reset_bsearch_count
    @@bsearch_count = 0
  end

  def self.merge_sort_count
    @@merge_sort_count
  end

  def self.reset_merge_sort_count
    @@merge_sort_count = 0
  end
end
#
# def naive_fib(n)
#   return 1 if n <= 1
#   fib(n - 1) + fib(n - 2)
# end
#
#
# def better_fib(n)
#
# end
