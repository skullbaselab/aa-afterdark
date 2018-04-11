# Notes

## Intro
* Introduce Self
* Introduce Staff
* Read All of First Day Stuff
* Answer Questions

## w0 recap
### Source Files / Writing Ruby Scripts
* extension `.rb` is traditional and tells atom how to highlight
* can `require './test'`, which will load the file in the current dir, `test.rb`
* require only loads once then returns false
* REPL - read-eval-print-loop, live interpreter
* the following will run the code if the script is invoked directly (not `require`d)

```ruby
if $PROGRAM_NAME == __FILE__
  name = gets.chomp
  say_hello(name)
end
```

## w1 recap
### d1 methods/objects
* methods are blocks of code referred to by name
* methods are associated with and object, functions not
* return value is last thing
* side effects are things that happen (puts, mutation) besides return value
* keep methods short and simple
* object: package for information
* in ruby everything is an object, inherits from `Object` can `puts` and `to_s`
* top level methods are defined on the `Kernel`, can call from every scope
* `nil` is nothingness
* `.class` `.is_a?` for checking type

### d1 arrays/strings/rspec
* can instantiate using `[]` or `Array.new`
* holds a list of elements accessible using `[idx]`
* can get a subarray using `ary[1..3]` (passing a range)
* enumerable methods: `each`, `map`, `select`
* can concatenate using `+`
* read length using `length`
* `<<` to push in new elements, mutates
* shift pulls out first element
* `join`, `include?`, `index`, `shuffle`, `first`, `sample`
* don't put different types of objects into an array
* can define strings with '' or ""
* if using "", can string interpolate and use escape characters like `\n`
* `split`, `downcase`, `*`, `gsub`
* `bundle exec rspec spec/file_01_spec.rb`

### d2 blocks/procs
* blocks/procs/break/return/to_proc/&:sym
* little pieces of code that can be easily passed around
* & can be used to turn a symbol into a proc that calls that method
* & can be used to capture a block into a proc
* proc is a first class object block
### Blocks and Procs

Passing a block has a different scope from defining a function.
``` ruby
name = "Sarah"

[1, 2, 3].each do |num|
  puts "#{name} love #{num}"
end
Sarah loves 1
Sarah loves 2
Sarah loves 3
#=> [1, 2, 3]

def meth
  puts "#{name} loves meth"
end

meth
#=> NameError: undefined local variable or method `name' for main:Object
```
That's becase the scope of the block is from wherever tha block was defined.

More examples:

``` ruby
def run_block &prc
  prc.call
end

run_block do
  return 'lol'
end

my_proc = Proc.new { return 'lol' }

def run_block_deeper &prc
  run_block &prc
end

run_block_deeper &my_proc
#=> LocalJumpError: unexpected return
```

``` ruby
def run_proc(some_proc)
  some_proc.call
end

prc = Proc.new { puts "i love bagels" }
run_proc(prc)
#=> i love bagels

prc = Proc.new { return "i love bagels" }
run_proc(prc)
#=> LocalJumpError: unexpected return

```
Return jumps outside the scope of `run_proc`


``` ruby
def jeff_each(arr, &prc)
  arr.length.times do |idx|
    prc.call(arr[idx])
  end
end

jeff_each([1, 2, 3, 4]) do |num|
  puts "#{num} is the best!"
end

1 is the best!
2 is the best!
3 is the best!
4 is the best!
```



### d2 iteration
* while, break, each, for, each_with_index, times, range, nested
* enumerable module: select, count, inject, each map, etc

### d2 classes
* blueprint for an object, stores definitions of methods
* can monkey patch an existing class just like if you were creating it new

### d3 hashes
* `Hash.new` or `{}`
* access values using `[key]`
* anything can be a key/value
* can `each` and get `k, v` args
* `delete` and `merge`, `keys` and `values`

### d4 classes and scope
### d5 code quality
* refactoring, debugging, coding style, dry
