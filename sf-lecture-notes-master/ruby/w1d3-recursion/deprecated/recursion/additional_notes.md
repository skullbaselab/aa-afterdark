# Week 1 Day 5


### Module vs Class

|  | class | module |
|-----------------|---------------------------------|-----|
| *instantiation* | yes                             | no |
| *consists of*   | methods, constants, variables   | methods, constants, classes|
| *methods*       | class methods, instance methods | module methods, instance methods |
| *inclusion*     | can't be included               | can be included in classes and modules by using `include` |
| *extension*     | can't be extended               | can extend an instance of a class by using `extend` |
| *inheritance*   | can only inherit from other classes |doesn't inherit |




Weird things in ruby
``` ruby
[1, 2] * 5
#=> [1, 2, 1, 2, 1, 2, 1, 2, 1, 2]

5 * [1, 2]
#=> TypeError: Array can't be coerced into Fixnum
```


## Recursion
``` ruby
# psudocode
class MovieGoer
  def which_row
    if @person_in_front_of_us?
      return 1
    end

    @person_in_front which_row + 1
  end
end
```

Quicksort
``` ruby
def quicksort(arr)
  # return arr if arr.length < 2

  pivot = arr.pop
  left =  []
  right = []

  arr.each do |el|
    if el < pivot
      left << el
    else
      right << el
    end
  end

  quicksort(left) + [pivot] + quicksort(right)
end

quicksort([8, 3, 1, 1, 4])
#=> [1, 1, 3, 4, 8]
```
If you leave out the base case, you'll get a `SystemStackError: stack level too deep` error. Hits stack overflow at about 7200-7700 frames

Jeff's favorite sorting algorithm
```ruby
def shitty_sort arr
  return arr if arr.sort == arr
  shitty_sort arr.shuffle
end
```
