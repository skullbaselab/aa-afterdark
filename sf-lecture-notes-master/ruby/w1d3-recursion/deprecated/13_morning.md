# W1D3

- Refactoring
- Scope
- Hash Defaults
- Solutions
- Projects
  + Mastermind
  + Hangman

---

## Warmup

- Why are you here?
- money
- like programming
- jobs
- learning programming
- challenge
- career
- make things
- location
- NETWORK

---

## Refactor Hanoi

---

## Content

### Refactoring and Code Smells

+  unDRY
+  Long methods -> Hard to test
+  Too many parameters
+  Dead/Lava code
+  God Objects
+  Strive for Clean Code
+  Code smell indicates a need for refactoring
+  Comments are code deodorant

---

##  Speculative Granularity

+ Follow the YAGNI principles
   + Not too general
   + Don't add new features until needed
   + Don't add new features until you understand the problem

+  Public methods that should be private
   + Have the smallest public interface possible
   + Strive for loose coupling
   + You don't want others using methods you might want to change

---

### Law of Demeter

+  (long method chains is the smell, talking to non neighbors is the
issue)
   + Comes from the demeter system, it was easy to change and they
observed and extracted the characteristic of LoD
   + Don't call `some_object.some_attribute.some_attribute` from another
class
   + Instead, make a method on that class that exposes it
   + Don't want one class to rely on the internal structure of another
class,
     as it might change

---

[DEMO](./by_topic/code_smells/hanoi_dirty.rb)
* Fix `run_game`
  * Make `get_move`
* Make private: `move`

---

## Scope

* Where a variable is accessible
* These create **new scopes**: Class, method, block
* You must define a variable before you can use it
* There is a **global scope**, but generally avoid it

**DEMO:**
```rb
puts $PROGRAM_NAME # Global variable, provided by Ruby

class Cat
  def say_hi
    greeting = 'Meow' # Local variable, only in scope within say_hi
    3.times do |num|
      # num is only in scope within the block
      # But greeting is still accessible
      puts "#{greeting} num"
    end
    # Can't access num here
  end
  # Can't access greeting here
end
```

---

## Hash Defaults

* Hashes and arrays can take default values
  * e.g. Create an array of 100 zeros: `Array.new(100, 0)`
  * e.g. Have value for a key in hash default to 0 on first access
    * `Hash.new(0)`
* Caveat: Be careful when using *mutable* objects
  * Bad: `Array.new(3, [])`
  * Good: `Array.new(3) { [] }`
    * Will be run once for each element (3 times)
  * Bad: `Hash.new([])`
    * Only specifies what's returned when a value isn't present
  * Good: `Hash.new { |hash, key| hash[key] = [] }`
    * Run each time a key is accessed for the first time
* *Immutable values* are okay:
  * Can't change the object's state

**DEMO**:
```ruby
arrays = Array.new(3, [])
arrays.first << 1
p arrays

arrays = Array.new(3) { [] }
arrays.first << 1
p arrays
```

```ruby
# Record the indexes that each character appears at
string = 'Ruby is sweet'
indexes = Hash.new([]) # FIX THIS LINE
(0...string.length).each { |index| indexes[string[index]] << index }
p indexes
```
```ruby
# Count up the frequency of each character
counts = Hash.new(0)
string = 'Ruby is sweet'
(0...string.length).each { |index| counts[string[index]] += 1 }
# Is the same as: counts[string[index]] = counts[string[index]].+(1)
```

---

## solutions

- What's #tap
- What's <=>

---

# Projects

---

## Mastermind

* Use a `Code` class to represent a sequence of colors
* Have the `Game` class use code instances for the correct color
* sequence
  and for the user's input

---

## Hangman

* Read ALL instructions
* Same API for human player and computer player
* Remind them about `__FILE__ == $PROGRAM_NAME`
* What's API?

---

Lecture Prep Videos:
+  Tapas: 008, 009, 012, 015, 032, 045
+  Upcase Weekly Iteration: 09
