# Week 1 Day 3

``` ruby
def method
  #code
  while condition
    break # breaks only out of the loop and continues
  end

  puts "hello" # will hit this line of code
end

def method
  #code
  while condition
    return # breaks out of the method
  end

  puts "hello" # will NOT get here
end
```

`and`/`or` have lower precedence than `&&`/`||`. In other words, `&&`/`||` get evaluated before `=`, while `and`/`or` get evaluated after `=`

The order in which these commands get executed:
- ! ~ + -
- <= < > >=
- <=> == === != =~ !~
- && ||
- =
- and or
- if unless while until

```ruby
a = 2 && a * 2
#=> NoMethodError: undefined method `*' for nil:NilClass

(a = 2) && (a * 2)
#=> 4
a = 2 and a * 2
#=> 4

b = 3 && false
b
#=> false
b = 3 and false
b
#=> 3
```

## Hash Defaults

```ruby
hash = Hash.new

hash['Superhero'] = []
hash['Superhero'] << "Ironman"
hash['Superhero'] << "Batman"
hash['snowman'] << "Olaf"
#=> NoMethodError, undefined method `<<` for nil:NilClass
```
we have to do
```ruby
hash['snowman'] = []
hash['snowman'] << "Olaf"
```

Instead of doing the above for every new key we add to the hash, we can pass a default value to the hash, ie
```ruby
hash = Hash.new([])
```
but then the problem is that any hash key is pointing to the same default array
```ruby
hash['Superhero'] << "Ironman"
hash['Superhero'] << "Batman"
hash['snowman'] << "Olaf"
#=> ['Ironman', 'Batman', 'Olaf']
hash
#=> {}
```

We're getting an empty hash because we're not setting a value for the key. Instead, we're getting the default value for the hash and pushing elements into it.

It's ok to do that if the default value is a number (or other immutable object), but it doesn't work with mutable objects (arrays, strings, hashes, etc).

The proper way to set an empty array as a default hash is:
```ruby
hash = Hash.new { |h, k| h[k] = [] }
```

#### Examples with `tap`
```ruby
[1, 2, 3, 4, 5, 6, 7].map do |n|
  n * n * rand(5)
end.map do |x|
  x + x
end.each do |el|
  puts el
end.map do |z|
  "#{z}ffff"
end.join("\t")

6
32
18
96
150
72
98
#=> "6ffff\t32ffff\t18ffff\t96ffff\t150ffff\t72ffff\t98ffff"
```

```ruby
def do_cool_thing
  result = []
  result << 'stuff'
  result << 'more stuff'
  result << 'even more stuff'

  result
end

# is the same thing as
def do_cool_thing
  [].tap do |result|
    result << 'stuff'
    result << 'more stuff'
    result << 'even more stuff'
  end
end

do_cool_thing
#=> ["stuff", "more stuff", "even more stuff"]
```
- `tap` adds another level of indentation. It's better practice to avoid doing that.
- `tap` is often harder to read.

```ruby
if __FILE__ == $PROGRAM_NAME
  #code
end
```
- The above is useful when you want to run your code through the command line
- `__FILE__` and `$PROGRAM_NAME` are global variables


- `ARGV` is an array of arguments passed to your program through the command line. For example:

```sh
~: ruby filename.rb arg1 arg2
```

Then inside filename.rb you can access the arguments with ARGV and

```ruby
ARGV = ["arg1", "arg2"]
```

**NB:** you have to call `ARGV.shift` in order to access the next argument!


- API stands for Application Programming Interface

Destructures assignment:
```ruby
a, b = "one", "two"
a, b = [1, 2]
```

Cool ruby stuff
```ruby
1 + 2
#=> 3

# is a shorthand for
1.+(2)
#=> 3
```
