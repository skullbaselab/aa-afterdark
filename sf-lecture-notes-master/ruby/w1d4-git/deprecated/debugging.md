# Debugging

Debugging is the process of removing errors, aka bugs, from your computer programs. Engineers spend arguably more time debugging their programs than writing them, making the ability to root out bugs a vital skill. Generally, programmers (at a certain level of proficiency) make roughly the same amount of errors. The difference between the good ones and the really good ones are that the really good ones can debug quickly. Learning this skill will make you far more productive.

## Types of Bugs

Bugs can come in a variety of flavors. The most common are:

* Syntax Bugs: These are the errors that appear when something occurs that is against the rules of the language. They are most often discovered by the compiler/interpreter. The best way to become better at finding syntax bugs is to become very familiar with the language you are working in.

* Logic Bugs: When your program is not doing what you expect it to do, you've hit a logic bug. These are the real killers because they often won't throw an error message, or the error message that is thrown doesn't directly reflect the bug. Managing the complexity of your system through refactoring and following style guidelines is the best way to root out this class of bug.

* Performance Bugs: When your program is correct, but it takes so long to run that it's infeasible to use, you've hit a performance bug. Utilizing what you know about computational complexity will be the best way to tackle these bugs.

## Debugging Techniques

### Clean Code

tl;dr - Write Clean Code.

When you have a bug, it means that you have misunderstood something about the way your program is operating. I have seen many many bugs rooted out by simply refactoring the code. If you look at your program and sigh at the task of understanding what's in front of you, IT IS TIME TO REFACTOR (in fact, if it gets to that level, you've already gone too far). The goal is to make your code be as readable as possible. You should be very serious about the names of your variables, proper indentation, sensible abstractions, etc. With clean code, you will avoid introducing many bugs and you'll be able to find the ones you do have much easier.

### Read The Stack Trace

tl;dr - Read the stack trace. The source of the bug may not be at the top of the trace.

When an error is thrown, programming environments provide a stack trace that shows exactly where the program failed. The stack trace also provides a trace of where that failing line was called from, and from where the line that called the failing line was called. So forth and so on.

There are times when the first item in the stack trace is unrecognizable, listing a file that's deep in some dependency. If you find yourself in this position, don't get flustered. Read the line underneath that one. Does it look fmiliar? No? Well how about the line under that. Most of the time, somewhere in the trace you will find a file that looks familiar. Find the line number specified in the stack trace and go look at the file.

Use the clues of the error message to help you in your debugging detective work.

 `undefined method 'myMethod' for nil:NilClass`

 What does this mean? Somewhere in your code, you called #myMethod on a Nil object. Find in the stack trace where this occurred and see if you can find where how you inadvertently called #myMethod on nil. READ THE MESSAGE. USE THE CLUES. BE AN AWESOME BUG HUNTER.

### Print Statements

A print statement is the quintessential debugging tool. It allows you to ask your program questions about it's state at a given time. However, if used improperly, they can become burdensome and even make the debugging process more difficult. Print statement tips:

* Do not litter your code with print statement. After you've found the bug, delete all of the print statements used in the hunt. Otherwise, they will pollute your future logs with irrelevant info and make future bugs harder to find.

* Ask good questions, aka print relevant things only. This requires an understanding of the problem at hand. Pointless print statements only clutter your logs and, by extension, your understanding.

* If using several print statements for a hunt, be sure to label them (string interpolation is a good option). This is remove the burden of you having to decode the logs so you can dedicate 100% of your mental energy on the bug. Which set of print statements are more readable/helpful:

```ruby
2
3
5
2
```

OR

```ruby
Value A: 2
Value B: 3
Value A: 5
Value B: 2
```

### Debuggers

Languages will often have debugging tools. I encourage learning how to uses these tools and they can make hunting complex and subtle bugs much easier. Ruby has ByeBug. [There's a wonderful tutorial on using it here.](https://vimeo.com/129370279)

### Know Your Environment

A large part of being an effective debugger is experience. Error messages are different for every environment. The more familiar you are with the environment and the errors that occur in that environment, the better you'll be and killing bugs quickly.

Experience will automatically bring with it familiarity. But if you want to gain bug familiar quickly, I encourage you to spend some time every week breaking your code. Purposely introduce errors into your code and observe the error messages. See if you can figure out how the clues in the stack trace lead back to the introduced error. This exercise will rapidly speed up your debugging process and make you more effective as a developer.
