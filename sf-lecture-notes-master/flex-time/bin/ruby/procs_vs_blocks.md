# Procs vs. Blocks

[Ruby Docs](https://ruby-doc.org/core-2.2.0/Proc.html#method-i-hash)

Procs are _objects_, blocks are like _anonymous functions_ that "float" out in the code unless assigned to a proc or passed into a method.

Wrapping a block in a proc like placing your method into a "box". Ampersand(&) operator "wraps" block in a box when used in function definition, then "unwraps" when used in code.

`yield` identical to `prc.call`, but less explicit (and your method can only take one block)

Can pass multiple procs, but only if they've already been "wrapped" (i.e. `Proc.new`)

prc.call **does** return a value that can be stored in a variable

```ruby
@times = 0

def function(&prc)
  puts "Do Stuff"
  prc.call() # can use .call because our block has been wrapped
  @times += 1

  if @times < 10
    function(&prc) # Unwraps our proc back into block format
  end
end

function() do
  puts "Do stuff"
end

proc.parameters # An example of a proc method that you can use after your block has been wrapped

new_proc = Proc.new { |name| puts "my name is #{name}!" }
new_proc.call("Bob") # => "my name is Bob!"
```