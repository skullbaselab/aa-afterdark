# Week 1 Day 3

```ruby
class Car
  def initialize
    @engine = V8.new
  end

  private

    def engine
      @engine
    end

  public

    # can access throtle directly, but not engine.add.fuel
    def throtle_up(val)
      engine.add.fuel(val)
    end
end

car = Car.new
car.engine # can't access the engine because it's under a private method
```

```ruby
attr_reader :name # can access the method, but you can't change it
attr_accessor :name # can access the method and can change it
```

### BLOCKS

- A `proc` is a snippet of code. It can be passed to a method.
- `&` turns a symbol into a proc

There are 3 ways to pass a block:

1. `do`/`end` block
```ruby
 pennies.each do |penny|
   # code
 end
 ```

2. same line with curly brackets
```ruby
 pennies.each { |penny| ... }
 ```

3. pass in a block
```ruby
 pennies.each(&proc)
 ```


*Jeff's reference to The Matrix.*

Debugger is like Neo: it stops the code like bullets and then you can look at them.

Difference between step, continue, next in debugger
  - `step`: step into a method
  - `next`: go onto the next line of code
  - `continue`: let the code run


```ruby
class Fighter
  attr_accessor :nickname
  attr_reader :name, :weight, :strength

  def initialize options
    @name =     options[:name]
    @weight =   options[:weight]
    @strength = options[:strength]
    @nickname = options[:nickname]
  end

  def train
    @weight -= 1
    @strength -= 1
  end

  def rest
    @weight += 1
    @strength += 2
  end

  def render
    names = @name.split
    "#{names.first} the #{@nickname} #{names.last}"
  end
end
```

#### How to test ruby code:
  1. open `pry`
  2. `load 'filename'`

```ruby
f = Fighter.new(name: 'Total Silence', strength: 7, weight: 350, nickname: 'Crushing Jackrabbit')

f.render
#=> Total the Crushing Jackrabbit Silence
```

- Ruby always returns the last line of code in the method unless you explicitly say `return`

- Symbol is like a string, but it's not mutable.

- `@name` is an instance variable
- `self.name =` calls the `name=` instance method

#### Ways to duplicate a string:

```ruby
# BAD!
s = "string"
t = s
```
if you change t, it'll change s as well and vice versa. That's because they're both pointing to the same spot in memory.

1. Call `String.new`
```ruby
s = "string"
t = String.new s
```

2. Use the `dup`
```ruby
s = "string"
t = s.dup
```
