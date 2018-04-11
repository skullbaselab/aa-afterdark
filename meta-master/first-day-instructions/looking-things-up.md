# Looking things up

Good programmers don't always know; they know how to look things
up. Beyond Google, there are a few key resources:

* [Stack Overflow](http://stackoverflow.com): SO answers are usually
  some of the best Google results. Make sure to not just look at the
  accepted answer, but also the one with the most votes; sometimes the
  asker doesn't recognize the correct solution.
* [Ruby Doc](http://ruby-doc.org/core-1.9.3): Ruby documents how all
  the core methods work. Invest the time to learn how to read this
  documentation.
    * You may prefer [API Dock](http://apidock.com/ruby)
      which gives you fast searching!

When searching the cause of a mysterious error, find the "top line" of
an error:

```ruby
[3] pry(main)> nc = NumbersClass.new
=> #<NumbersClass:0x007ff9dc12c608>
[4] pry(main)> nc.numbers
NameError: undefined local variable or method `favorite_nmber' for #<NumbersClass:0x007ff9dc12c608>
        from: /Users/ruggeri/test.rb:11:in `numbers'
        from: (pry):4:in `__pry__'
```

Here the "top line" is `NameError: undefined local variable or method
'favorite_nmber' for #<NumbersClass:0x007ff9dc12c608>`. This (minus
that trailing hexadecimal number, which is a *memory pointer*) is
often very Google-able. But also make sure to read the [common
exceptions chapter](https://github.com/appacademy/curriculum/blob/master/ruby/readings/common-exceptions.md)
in ruby-curriculum.

You'll receive a whole reading on debugging soon!
