def bubble_sort ary_to_sort
  ary = ary_to_sort.dup
  return ary if ary.length < 2
  sorted = false
  until sorted
    sorted = true
    0.upto(ary_to_sort.length - 2) do |i|
      if ary[i] > ary[i + 1]
        ary[i], ary[i + 1] = ary[i + 1], ary[i]
        sorted = false
      end
    end
  end
  ary
end

def quick_sort(ary)
  return ary if ary.length <= 1
  pivot = ary.pop
  left, right = [], []
  ary.each do |el|
    if el < pivot
      left << el
    elsif el > pivot
      right << el
    end
  end
  quick_sort(left) + [pivot] + quick_sort(right)
end

sorted = (1..50000).to_a
shuffled = sorted.shuffle
reversed = sorted.reverse

require 'benchmark'

puts

puts "bubble sort!!!!!!!!!!!!!!!!!"
Benchmark.bm do |b|
  b.report("sorted:   ") { bubble_sort(sorted) }
  b.report("shuffled: ") { bubble_sort(shuffled) }
  b.report("reversed: ") { bubble_sort(reversed) }
end

puts

puts "quick sort!!!!!!!!!!!!!!!!!"
Benchmark.bm do |b|
  b.report("sorted:   ") { quick_sort(sorted) }
  b.report("shuffled: ") { quick_sort(shuffled) }
  b.report("reversed: ") { quick_sort(reversed) }
end
