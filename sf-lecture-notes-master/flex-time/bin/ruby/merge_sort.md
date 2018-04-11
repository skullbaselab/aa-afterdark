## Merge Sort Notes (Flex Time 12.8.17) 
* Walked them through the code step by step 
* Afterwards covered common mistakes like: 
  * forgetting to use lazy operator `||=` when assigning to the default proc
  * including the middle element in both sides of the arrays
  * not calling `merge_sort` when passing the left and right arrays in the merge function
  * using `left.first` / `right.first` in `prc.call` and NOT `shift`
  * using `shift` and NOT `first` within the case / conditional inside our until loop
  * `concat`ing and NOT `push`ing the merged, left, and right arrays at the bottom of the `merge` helper method
* Explained they could key into `self` OR use `take/drop` 

```ruby
class Array
  def merge_sort(&prc)
    # See how I create a Proc if no block was given; this eliminates
    # having to later have two branches of logic, one for a block and
    # one for no block.
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1
    
    midpoint = count / 2
    sorted_left = self[0...midpoint]
    sorted_right = self[midpoint..-1]

    Array.merge(sorted_left.merge_sort(&prc), sorted_right.merge_sort(&prc), &prc)

  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    # merged.concat(left)
    # merged.concat(right)

    merged + left + right
  end
end
```