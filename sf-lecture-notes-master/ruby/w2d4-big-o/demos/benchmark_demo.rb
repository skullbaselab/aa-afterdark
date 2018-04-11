def bubble_sort(ary)
  ary = ary.dup
  sorted = false
  until sorted
    sorted = true
    0.upto(ary.length - 2) do |i|
      next if ary[i] <= ary[i + 1]
      ary[i], ary[i + 1] = ary[i + 1], ary[i]
      sorted = false
    end
  end
  ary
end

def quick_sort(ary)
  return ary if ary.length <= 1
  pivot = ary.sample
  left = ary.select { |el| el < pivot }
  mid = ary.select { |el| el == pivot }
  right = ary.select { |el| el > pivot }
  quick_sort(left) + mid + quick_sort(right)
end

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


require 'benchmark'

short = (1..1_000).to_a.shuffle
med = (1..5_000).to_a.shuffle
long = (1..10_000).to_a.shuffle

puts "bubble sort!!!!!!!!!!!!!!!!!"
Benchmark.bm do |b|
  b.report("1,000:   ") { bubble_sort(short) }
  b.report("5,000:  ") { bubble_sort(med) }
  b.report("10,000: ") { bubble_sort(long) }
end

puts "quick sort!!!!!!!!!!!!!!!!!"
Benchmark.bm do |b|
  b.report("1,000:   ") { quick_sort(short) }
  b.report("5,000:  ") { quick_sort(med) }
  b.report("10,000: ") { quick_sort(long) }
end

puts "merge sort!!!!!!!!!!!!!!!!!"
Benchmark.bm do |b|
  b.report("1,000:   ") { short.merge_sort }
  b.report("5,000:  ") { med.merge_sort }
  b.report("10,000: ") { long.merge_sort }
end
