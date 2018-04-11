# W1D2

---

### Hi, I'm Ned

---

![thor](https://s-media-cache-ak0.pinimg.com/736x/3b/12/45/3b1245e452a52b529b96bca3854b3eee--puppies-in-costumes-dog-costumes.jpg)

---

### Typical Lecture Format

* Today's Material
* Quiz Solutions
* Open Forum / Break

---

### Lecture Agenda

1. Brief overview of References in Ruby
1. Code Demo
    * Array and Hash defaults.
1. Code Style

---

## References in Ruby

---

### Variables

* Objects are stored in memory
* Ruby variables hold references: pointer to designated object
* `=` _assigns_ the variable pointer, `=` doesn't change or *mutate*
  the object stored in memory

Note:
This slide will require a lot of explanation and demos

---

### What's the difference?

* `concat`
* `+=`
* `<<`

---

## Code Demo

* `Array.new`
* `Hash.new`
* `Coordinate`
    * `+=`, `!=`, `||=`, `[]=`

---

## Code Style

---

`"Imagine you are writing an email. You are in front of the
computer. You are operating the computer, clicking a mouse and typing
on a keyboard, but the message will be sent to a human over the
internet. So you are working before the computer, but with a human
behind the computer. Most of the tasks we do are for humans."`

Yukihiro Matsumoto, Chief Designer of Ruby

---

### Guidelines

* Style is essential - **follow the style guide!**
* During interviews, poor code style is a dead giveaway that someone
  lacks experience.
* Good ruby code should **read like English**.

---

### Rules

#### Snake, camel case, screaming snake in Ruby

  ```ruby
    variable_names = "snake_case"
    ClassNames = "CamelCase"
    CONSTANTS = "SCREAMING_SNAKE_AHHHH!"
  ```

---

#### `{}` > `do .. end` for one lines

  ```ruby
    [1, 2, 3].each do |el|
      # multiple
      # lines
      # ...
    end

    [1, 2, 3].each { |el| puts el } # single line!
  ```


---

#### single line `if` / `unless`

  ```ruby
    if truthy_thing?
      # multiple
      # lines
    end

    puts "truthy!" if truthy_thing? # single line!
  ```
---

#### 80 character limit for lines

```ruby
rant = "You could write really, really, really long lines in Ruby but that is bad code style should be avoided.  Do not have more than 80 characters on one line."
```

---

#### Interpolation > Concatenation

  ```ruby
    name = "Markov"

    puts "Why, hello there " + name + ", have a lovely day!"

    puts "Why, hello there #{name}, have a lovely day!"
  ```

---

#### Use `!` for mutating methods, `?` for boolean methods

  ```ruby
    "abc".upcase!
    [1, 2, 3].reverse!

    5.even?
    "abc".is_a?(String)
  ```

---

#### Prefer block parameters over `yield`

  ```ruby
    def do_the_thing(x, &prc)
        prc.call(x)
    end
  ```

---

### No Code Golf

  ```ruby
    def digitize(num)
      [].tap { |digs| (num, dig = num.divmod(10); digs.unshift(dig)) until num.zero? }
    end

    def ping_pong_filter(arr)
      arr.tap { |a| a.reject!.with_index { |el, i| i.even? }.reverse! until a.length == 1 }[0]
    end

    def increase_responsiveness?(arr)
      arr.each_cons(3).any? { |a| a.all? { |n| n > 0 } || a.all? { |n| n < 0 } }
    end

    def neighbor_sum(arr)
      [0, arr, 0].flatten.tap { |a| return a.map.with_index { |_, i| a[i - 1] + a[i + 1] if a[i + 1] }[1..-2] }
    end
  ```

---

### Other Important Rules

* Always properly indent!
* No one letter variable names like `x` or `i`!
    * Exception is loops.
    * But even for loops, good to use more meaningful names.
    * Especially when using nested loops.

Note:
It is very apparent that someone is inexperienced if they don't indent their
code correctly. Embrace it and take the time to get it right now, it will be
worth it.

---

## Quiz Solutions

[Solution](https://github.com/appacademy/daily-quiz/blob/master/ruby/w1d2.md)

