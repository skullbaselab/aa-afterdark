# W1D2: Monkey Patching

Monkey patching will dynamically modify a class by adding/modifying methods during runtime.

History: Monkey Patching comes from guerilla patching, which comes from guerilla warfare 

```ruby
def factors(num)
  (1..num).select { |i| (num % i) == 0 }
end

factors(6) => [1, 2, 3, 6]
```


```ruby
class Fixnum
  def factors
    (1..self).select { |i| (self % i) == 0 }
  end
end

6.factors => [1, 2, 3, 6]
```
