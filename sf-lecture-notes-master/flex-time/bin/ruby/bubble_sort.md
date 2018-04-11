# W1D2 - Bubble Sort

1. How Bubble Sort Works by hand [2, 1, 3, 5, 4]
2. Coded Monkey-patching Array version on whiteboard
3. Altered it to accomodate a proc

```ruby
class Array
  def bubble_sort!
    sorted = false

    until sorted
      sorted = true

      each_index do |i|
        next if i + 1 == self.length
        j = i + 1
        if self[i] > self[j]
          sorted = false
          self[i], self[j] = self[j], self[i]
        end
      end
    end

    self
  end

  def bubble_sort!(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    sorted = false
    until sorted
      sorted = true

      each_index do |i|
        next if i + 1 == self.length
        j = i + 1
        if prc.call(self[i], self[j]) == 1
          sorted = false
          self[i], self[j] = self[j], self[i]
        end
      end
    end

    self
  end
end
```