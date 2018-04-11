# W2D4
#### Analysis of Algorithms

---

### Agenda

* Big-O Notation
* Quiz
* Today's Projects
* Open Forum

---

# Big-O

What is it? Why do we care?

---

### History of Big-O

* The symbol O was first introduced by number theorists Paul Bachmann and Edmund Landau in 1894
	* Referred to as Bachmann–Landau notation
	* Other notable classifications include Big-Ө and Big-Ω

* Big-O originally referred to the German word _ordnung_, meaning "order of"

* Donald Knuth (_The Art of Computer Programming_) coined the phrase "analysis of algorithms" and popularized Big-O notation in the 1970s.

---

### Asymptotes

* An asymptote of a curve is a line such that the distance between the curve and the line approaches zero as the input size grows to infinity.

---

## Asymptotic Behavior

* The _asymptotic behaviour_ of a function refers to its rate of growth as its input size approaches infinity.

* Allows us to focus on the big picture and compare algorithms from a high level.

* Big-O notation is a tool for understanding asymptotic behaviour.

---

![Complexity Chart](http://bigocheatsheet.com/img/big-o-complexity-chart.png "Complexity Chart")

Source: **bigocheatsheet.com**

---

Okay, yes, but **why** do we care?

---

## Efficiency

---

#### Bragging Rights 
:)

---

### Some examples

* Sort 100,000,000 people by social security number

* Is the number 6,700,417 prime?

* Search the entire internet for "cat pictures" and rank the results by relevance :)

Note: Point out, it's easy to implement a solution to any of these problems that would take hundreds of years. Using clever, or really just thoughtful, algorithms and data structures, it can take seconds. This also helps the students see why Big O matters even when we ignore constants. A constant multiple of 20 minutes is 40 mintues, or maybe 60. Switching from quicksort to bubble sort can take you from 20 minutes to 200 years.

---

#### Example 
* Largest known prime: 
```
300376418084606182052986098359166050056875863030301484843941
693345547723219067994296893655300772688320448214882399426727

... (22,338,378 digits omitted) ...

717774014762912462113646879425801445107393100212927181629335
931494239018213879217671164956287190498687010073391086436351
```

---

## Things to Remember

1. Many factors affect the time it takes for a function to run: the speed of the processor, what else the computer is running, etc. Big-O notation is only concerned with performance relative to the _input size_.

2. An algorithm may have steps that seem expensive when n is small but are eclipsed by other steps as n approaches infinity. We only care about the stuff that grows the fastest as the input grows.

---

## More things to remember

* Big-O notation describes an algorithm's *worst* case.

* Big-O talks about *orders*, not about specifics (i.e. O(2n) and O(100n) are really both just O(n))

* We can measure both time and space complexity, but are mostly concerned with time (memory is cheap and abundant)

---

# Domination

We say `f = O(g)` if the coefficient `g` _dominates_ the function `f` as the input size approaches infinity

---

#### Fine print

##### Really `f = O(g)` if a _constant multiple_ of `g` _eventually_ dominates `f`

---

## We don't care about these

- constant coefficients
- all but the largest growing term (the term which _dominates_)

---
## Examples

`12n^3 + 3n^2 + 10`

  becomes O(*n^3*)

`5*2^n + 3n!`

  becomes O(*n!*)

---
## Big-O hierarchy

- Constant `(1)`
- Logarithmic `(log n)`
- Linear `(n)`
- Linearithmic `(n log n)`
- Polynomial/Quadratic `(n^2)`
- Exponential `(2^n)`
- Factorial `(n!)`

---

![Complexity Chart](http://bigocheatsheet.com/img/big-o-complexity-chart.png "Complexity Chart")

Source: **bigocheatsheet.com**

---

### Constant Time
O(1)

```ruby
def first_thing(array)
  array.first
end
```

```ruby
def three_hundred_thousand_puts(name)
  300000.times { puts "hello, #{name}" }
end
```

---
### Logarithmic
O(log n)

```ruby
def bsearch(nums, target, start = 0, finish = nums.length)
  return nil if start == finish

  mid = (finish - start) / 2 + start
  case target <=> nums[mid]
  when -1
    bsearch(nums, target, start, mid)
  when 0
    mid
  when 1
    bsearch(nums, target, mid + 1, finish)
  end
endx
```

Note:
This implementation of bsearch uses indices to track what region is
being searched.
In the recursion solutions, we use `take` and `drop`, which are O(n),
making that solution O(n log n), not O(log n).
This is how Ruby implements its binary_search.

On this slide, explain that we might have to keep dividing our
search space by 2 until we reach a single element.
n /2 /2 ... /2 can be represented as n / (2^k).
At most, we have: n / (2^k) = 1

So k = log(n) recursive calls at most

---
### Linear Time
```ruby
def print_all(array)
  array.each { |el| puts el }
end
```

```ruby
def most_common_char(word)
  count = Hash.new(0)
  word.chars.each { |char| count[char] += 1 }
  count.max_by { |_, n| n }
end
```
The second example is O(2n)
---

```ruby
class Array
  def include?(array, value)
    array.each do |el|
      if (element == value) return true
    end
    
    false
  end
end
```

Even though this example may return immediately, it is still linear time because asymptotic analysis is concerned with the _worst_ case.

Note:
Comment that even though the second example
loops through the chars twice, it is still only linear time
because the loops aren't nested, so they add rather than multiplying

---
### Linearithmic / Log-linear
```ruby
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
      merged_array << ((left.first < right.first) ? left.shift : right.shift)
    end

  merged_array + left + right
end
```
---

### Linearithmic / Log-linear
![Merge sort](https://i.stack.imgur.com/lF95K.png "Merge Sort")

---

### Quadratic
O(n^2)

```ruby
def all_pair_sums(array)
  sums = []

  array.each do |el1|
    array.each do |el2|
      sums << el1 + el2
    end
  end

  sums
end
```

* Quicksort (yes, really)
* Bubble Sort

Note:
Technically Quicksort is worst case: quadratic, but it almost always runs in linearithmic time. That's why colloquially people often say it's O(n log n), even though technically it's O(n^2)

Note: (again)
A common question at this point is "why use quick sort vs. merge sort?" The short answer is, Quicksort is usually faster but more variable in terms of performance, while merge sort is consistent. In addition, merge sort is better when you are in a parallel computing or asynchronous environment, due to its recursive nature.

---

### Exponential
O(k^n)

```ruby
class Array
  def subsets
    return [[]] if empty?
    subs = take(count - 1).subsets
    subs.concat(subs.map { |sub| sub + [last] })
  end
end
```

Note: see notes for an explanation of runtime

---

### Factorial
O(n!)... or O(n * n!)

```ruby
def permutations(array)
  return [array] if array.length <= 1

  first = array.shift

  perms = permutations(array)
  total = []

  perms.each do |perm|
    (0..perm.length).each do |i|
      total << perm[0 ... i] + [first] + perm[i .. -1]
    end
  end
  total
end
```

---

### ???

```ruby
# all permutations of the odd elements of array

def odd_perms(array)
  collections = array.permutation.to_a

  collections.map do |subset|
    subset.select { |n| n.odd? }
  end
end
```

Note:
complexity: O(n * n!)
better way?
- select odd numbers first
- if numbers are random: O((n/2)!)

---

## Benchmarking demo

Note:
Before lecture, take a quick look at the Benchmark module:
http://ruby-doc.org/stdlib-2.4.1/libdoc/benchmark/rdoc/Benchmark.html

---

#### Okay, so when do we use this?
* Answer: almost never
* BUT! The cases when we do are extremely important

---

#### Cases where algorithm efficiency matters

* Interviews
* Building large scalable applications
* Building apps for limited hardware
* Fixing bottlenecks in performance

---

#### 9 times out of 10, *readable* code is much more important than efficient code

  Efficiency of program execution time 
  
  VS
  
  Efficiency of developer time
  
"If you optimize 100% of your code, you're wasting 90% of your time" (**premature optimization**)

---

### Quiz

[Solution](https://github.com/appacademy/daily-quiz/blob/master/ruby/w2d4.md)

---

### Projects

[Execution Time Differences](https://github.com/appacademy/curriculum/tree/master/ruby/projects/execution_time_differences)

[Anagrams](https://github.com/appacademy/curriculum/tree/master/ruby/projects/anagrams)

[Two Sum](https://github.com/appacademy/curriculum/tree/master/ruby/projects/two_sum)

[Max Windowed Range](https://github.com/appacademy/curriculum/tree/master/ruby/projects/max_windowed_range)

---

# Open Forum
