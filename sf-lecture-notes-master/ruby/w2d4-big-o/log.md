# W2D4 - Asymptotic Analysis/Big O Notation/Time Complexity

## 02/22/2018

Lecturer: Tommy
Scribe: Aaron

### Questions

+ So we wouldn't reduce `O(n*logn)` to `n`? We can only cross off
  constant terms. We can't cancel out multiplication, only addition
+ Whats the `n` in our `O(n*logn)` `bsearch`?
  + At each level, we need to copy over half the array when using the
    `take` and `drop` methods
+ I can see that we have more than `log(n)` levels?
  + The levels below the base case are just the `merge` step of each
    level above it
+ Should we take the number of stack frames into account when looking at
  big-o?
  + We should for recursive problems, because the number of stack frames
    will be related to the input size. With iterative algorithms, it
    will only depend on the big-o of what happens inside the iteration
+ Something about memoization
  + There are ways that we can save on memory and time complexity by
    doing things like memoization. So there is often a trade-off
    between time complexity and space complexity
+ When do we make the trade-off of readablilty for efficiency?
  + Always go for readability. Then, if you see that portion is a
    bottleneck, you can optimize it. It doesn't matter what the time
    complexity is for most functions you write. We aren't writing algos
    for lots of data
+ There is also a trade-off for space and time. How do we determine that?
  + That will really depend on the problem. What is the data, what
    hardware are you using, depending on industry, there can also be
    regulatory restrictions that limit _how_ you have to handle the data
+ What about interviews about big-O
  + We're going to talk a lot about this in the job search curriculum.
    It will be up to the interviewer. Any and all of the above

## December 14, 2017
  + Lecturer: Stephen
  + Scribe: David

Note to future lecturers:
  This is a very challenging lecture, primarily because it is the most math heavy. Prepare adequately and make sure you have a strong understanding of the various "proofs" for each problem. I've personally found that asking/debating your fellow instructors is a great way to gain a firm understanding.


## Lecturer: David
### October 2, 2017
### Scribe: AJ

## Questions
### Presentation

+ If you had something like 3^2n, what would that be?
  + Most people would say that falls into exponential, which sort of relates to something import, big O isn't the end all be all. Constants still do matter, this is just a tool to help determine the hierarchy.
+ For the exponential, is it always 2^n?
  + Often times people say k^n, it doesn't always have to be 2.
+ Don't understand how bsearch is log n
  + We were creating two new variables, we were assigning the left and right to variables, and we have to iterate through each to do so, which is n
+ Are programs ever written to delegate to certain algorithms based on size
  + Fascinating question, I've been told sort in ruby does this. This would be a great thing to do.
+ In our homework, the phonebook example uses this idea of splitting the search to search faster
  + You don't want to copy the entire phonebook into a new phonebook and then search, bsearch would be a way to search more efficiently
+ When you're talking about an algorithm do we need to have different big O based on which data structure we use?
  + Most times we talk about the "best" / "efficient" / "most thought out" version of it using a certain data structure
+ For example, if you're looking at a tree of trees, would we ever see that? It could be really bad because we'd have to search through so much?
  + Maybe in that case, it would be hard to assess what we should use, but we could also have multiple variables in determining big O when we have multiple variables that influence big O
+ Is the memory n^2 for linearithmic / log-liner in mergesort?
  + It is n log n
+ Can you elaborate on where the n part comes from?
  + It is the merging, having to look at every element
+ So if you looked at all the operations would it be adding all the iterations up?
  + The important thing to remember is to conceptualize what is going on and dominates the other operations
+ So why are we talking about the average case? I thought we only talked about worst case?
  + For practical purposes we can treat it like n log n, but it is n^2 (despite it being very rare for this case to happen)
+ Are there cases when quicksort runs better than merge sort?
  + Not entirely sure, but we can look that up -> Big O cheatsheet
+ *Scribe Note: on the '???' slide for the demo code, they are using Ruby's built in permutation method which does not return an array, thus we need the .to_a at the end of the first line*
+ The input size is the size of the array? What if the n is changing in our function call / recursion?
  + For this example, the subset term is confusing because they'd always be the same length.
  + ...walks through quicksort as example of recursive call where n is shrinking but shows why it is n^2 ...

### Projects


## Lecturer: Aaron
### August 10, 2017
### Scribe: Stephen

##Questions
### Presentation

+ If we don't care about constants, why do we include n in nlogn?
  + Constants do not change, but n is a variable, which does change depending on the input.

+ Is array indexing O(1)?
  + Yes, because of the way arrays are stored in memory, you can index into them in O(1) time.

+ Explain max_by?
  + Max returns the maximum according to the block you pass in. In this example, with a hash, we do not use a key, and find the maximum value, n.

+ Does merge sort differ in binary search in efficiency?
  + Yes, because each step of merge sort iterates through the array parts, merge sort is nlogn, while binary search is just log n.

+ Is merge sort always nlogn?
  + Yes, best and worst-case scenarios for merge sort are nlogn.

+ If quadratic is so bad, why is quick sort called quick sort?
  + Quick sort's average case is nlogn, but the worst case is quadratic.
  + *Scribe note: Average case quick sort is better than merge sort.*

+ Why doesn't n! dominate n(n!)?
  + Because they're being multiplied together. Domination primarily applies to addition.

### Projects

+ What is .send?
  + Can pass in a string or symbol, equivalent to calling that method on the receiver
  + Can take a string or symbol

+ Example of n**n?
  + I can't think of one and you shouldn't try to either, lol.



## Lecturer: Luke
### June 8, 2017
### Scribe: David

#### Questions
+ Is n^n worse than n!?
  + yes

+ Does faster mean that the runtime grows faster or the algorithm performs faster?
  + Depends on what you are discussing. A 'faster algorithm' vs.
  'the computation time grows faster for n! than for log(n)'

+ What's the time complexity to iterate through the hash?
  + Linear in the number of keys of the hash.
  + In the case of letter counts, constant because there are only 26
  letters and therefore a maximum of 26 keys in the hash.

+ How did you get to n*log(n) for merge sort?
  + Luke re-explained merge sort

+ Doesn't n dominate log(n), why do I have to keep both of them?
  + You can only eliminate terms when you're adding them, not when
  they are multiplied

+ Why don't we look at n^2?
  + We will. wait for next slide.

+ I thought quicksort was linearithmic time, is it really quadratic?
  + On average, it is n*log(n). It almost always will be.
  It is incredibly unlikely that it would be worse, but technically the
  worst case is quadratic.

+ If quicksort and mergesort are about the same, why would you use one
over the other?
  + Ultimately, a lot of other factors matter, including constant factors
  which big O ignores.
  + Another factors to consider: stability. Stable sorts vs unstable sorts.
  + Merge sort is stable while quick sort is not.
  + Also, caching considerations. I believe that quicksort can make
  good use of caching while other algorithms may not.

+ What are the space complexities of quicksort and mergesort?
  + Quicksort is constant, mergesort is usually linear but can be constant if you
  are very crafty. Mergesort typically implement with linear space complexity.

+ Can you go back to subsets and clarify why its exponential?
  + Luke went back and re-explained subsets.

+ What is an example of an n^n algorithm?
  + Don't know.

+ Can you share the benchmarking demo?
  + Look in the lecture notes repo.


# 4/6/2017
Lecturer: Luke Wassink
Notes by Gage

## yesterday's projects:
+ ??
  + ??
    + can you include a module in another module?
      + no, and that reminds me, this is allowing one module to tell
      the class including it to include another module
## homework:
+ dominant octopus?
  + talk to me after lecture
## quiz:
+ Q3: linearithmic?
  + linearithmic just means nlog(n)
    + doesn't log-linear mean the same thing?
      + yes
    + linear vs. linearithmic?
      + O(n) vs. O(nlogn)
    + linear + logarithmic = linearithmic
      + yes
    + best speed vs. avg speed vs. worst speed?
      + depends on the input; it can get pretty complicated
    + besides merge sort, what else is nlogn?
      + quicksort sort of is, divide-and-conquer algorithms in general
      tend to be nlogn
        + binary search?
          + logn
    + is avg more valuable than worst case?
      + usually, yes
    + are we supposed to memorize which algorithms are in which categories?
      + memorize some, but you should be able to figure it out if they're simple
    + ignoring constants in big O?
      + constants do matter in the real world, but (we'll return to it
      in lecture)
    + ??
      + we'll get into that more in lecture
    + does polynomial mean all n^k functions?
      + yes, but different values of k are different classes of functions
## lecture
+ n ^ n > n! ?
  + yes, but it doesn't come up very often
+ is `array.last` constant?
  + it depends on the implementation, but in general, yes
+ ??
  + you will build your own hash in a project, so wait for that
+ how does an array know it's gotten to the last one?
  + arrays tend to store their length
+ how is bsearch logn?
  + how many times do we have to divide n in half to get to k? -> logn
+ if at each step you did nlogn work?
  + not really applicable
+ binary tree vs. ternary tree, &c.?
  + same big O -> logn
+ is this big O analysis common in interview questions?
  + seems rare, but could happen
+ ?? 2logn? (what if you weren't merging?)
  + still be worse than bsearch
+ bsearch needs a sorted array; linear search works on any array ...??
  + some algorithms require inputs to be structured in a certain way or
  perform optimally when the inputs are structured in a certain way,
  and that's a good thing to know
+ ?? (can you have a loop within a loop that's not quadratic?)
  + it's possible, but the inner loop would have to be getting shorter
  very quickly
+ outer loop iterating through an array, inner loop starting at outer
loop's index?
  + still quadratic
+ what sort does ruby use?
  + i'd guess merge sort; someone said quicksort - it could be that
+ ??
  + when making a subset, the choice for each element is: should that
  element be included (a binary choice)
+ n * n! (permutations of subarrays)?
  + that would take a lot longer
+ ?? ()
  + exactly right
+ ??
  + depends on what the inner loop is doing
+ mapping is linear, no?
  + yes, linear to the length of the array being mapped over
### benchmarking
+ why take a random element from the array in quicksort?
  + it fixes a problem quicksort has with reverse-sorted inputs
+ 3n vs. n?
  + same big O, but optimized
+ if they're both O(n^2), why is quicksort so much faster?
  + think of quicksort as being nlogn with a couple rare exceptions
    + hence the `sample`?
      + sampling makes it hard to predict which inputs will take a long time
+ how exactly does the benchmark gem work?
  + focus on the last column
notes:
+ repeat the question!
+ worst case can be more valuable than avg because it bounds the
performance of an algorithm in a way that can be helpful for predicting
performance
+ question floodgates got opened in the quiz section
+ great explanation of the efficiency motivation!
+ nice proof to get to `logn = k`, nice explanation of 2^n subsets


# 2/2/2017
Lecturer: Shamayel Daoud
Notes by Gage

## Questions
**RSpec**
+ difference between `be_truthy`, `be_true`, and `be true`? # truthy =>
represents a value but is not `true`
+ line 102 - player spec uses `be_folded`? how does RSpec know what `folded`
is? # RSpec must have access to all of that class's methods
+ `Deck#deal_hand`? # hand and deck should be coupled in some sense
+ `*` in RSpec? `include` in RSpec? # RSpec's `include` is different from Ruby's
+ when do you use `subject` vs. `let`? when do you use variables? # subject is
the thing you're testing; things defined with `let` are supporting characters
+ ?? # out of scope
+ ?? # unit testing should test just that unit in isolation
  + ?? # unit tests have to pretend that the other classes work; integration
  tests require those classes to work
+ declaring a variable in `let` or inside the `it` block? # a one-time variable
can be defined in `it`; otherwise use `let`
+ if you need to run a method on each variable defined in a `let` block? #
`before_each` should work for that

**Homework**
+ ?? # arrays are ordered; hashes are unordered.
  + how do hashes work? # out of scope; O(1) operation
  + is lookup by index in an array O(1)? # yes
+ Enumerable methods - linear or constant? # linear
  + so our implementations are the same as Ruby's? # essentially, yes
+ what is "O" in "O(n)"? # "order" sounds right
+ does recursion count as a loop? # it can; it depends on how much work it
takes to get to your base case

**Quiz**
+ Q1 - in O(nlogn), isn't one of them dominant? # no, because it's `n * logn` not `n+ logn`
  + is the only reason we have O(nlogn) because so many sorts have that time
  complexity? # no, it is a real time complexity
+ Q3 - what if the inner loops don't iterate over the entire list? # usually
still O(n^2); sometimes O(nlogn)
+ Q4 - is there a better way to do permutations? # not really
+ Q4 - what about while loops? # how many times is that loop running?
+ Q4 - what if you only wanted one permutation? # ??
+ if you have a function the runs logn times but does n^2 work inside of it, what's its time complexity? # n^2 * logn

**Big O**
+ couldn't we cache a list of primes? # generating that list is cost n at least
+ is 10 ... ? # 10 is constant time, which gets dominated by the other terms
+ is `array.last` also constant? # yes
+ do we have to know the time complexity of every other function we use? # yes,
because they determine the time complexity of code that uses them
+ is division in constant time? # essentially, yes
+ does an array know its own length? # it depends on Ruby's implementation
+ what about subarrays? # ??
+ ?? # saving work to a variable can make your code run faster in certain
circumstances
+ do you have to count the sorting in the big-O analysis of binary search? #
b-search assumes that the array is already sorted; sorting would dominate
searching in big-O terms
+ ?? # logarithms are the opposite of exponents, graph-wise
+ but when there's no asymptote, what is big-O analysis doing for us? infinity
== infinity? # we care about the values as the input _approaches_ infinity, not
_reaches_ infinity
+ ?? + sorting the array in b_search will make your function's cost be O(nlogn)
+ so if b_search sorted and called itself recursively? # maybe nlogn*n
+ why do we use arrays at all if hashes are so much better? # arrays maintain
order; often we don't want to store k-v pairs
+ ?? # quicksort's worst case can cause it to be an O(n^2) operation
+ why do we need to use this quicksort instead of sorting in place? # this is
just one implementation of these algorithms
  + quicksort is actually faster because it does fewer comparisons # let's look
  at some demos
  + why is bubble sort n^2? # don't use bubble sort; it needs to compare every
  element against every other element
+ does "O" stand for omicron? # ...
+ does random elements for quicksort speed it up? # yes, there are several
optimizations you can do to make quicksort run faster
+ ?? # in practice, quicksort and merge sort are the same order
+ is there a situation in the real world where you know the size of the input
and it's not random? # if you knew the size of the input you could probably
write it in constant time
+ ?? # bubble sort is very slow
+ if you had one thing out of place in an array, could you use bubble sort? #
sure
+ if you wanted the data store at two indices, is that different from getting
the range between idx1 and idx2? # yes
+ O(2^n)? # exponential. n^2 is polynomial
+ ?? # collections is n!; doing n work on each of them means that overall the
cost is nn!
+ isn't (n+1)n! > nn!? # no, do the algebra
  + no, let me draw on the whiteboard # ... no
    + but (n + 1)! > n!, right? # ... no
+ does multiplying by a constant change the big-O? # no
+ ?? # yeah, that comes up in interviews pretty often
+ how do we find out what ruby's implementation is for things? # google it

## Other
Websites I used in demos:
+ http://bigocheatsheet.com/
+ https://cryptic-tundra-51153.herokuapp.com/
+ https://www.toptal.com/developers/sorting-algorithms/random-initial-order

--

## 9/22/16
Lecturer: Ryan Hall

### Questions

#### Rspec

  + How do you know if your tests are too in depth or not robust enough
  + Public or private methods - for testing? How would you test a private method. Walked through an example using the send method.
  + Questions about doing integration testing - without really knowing what integration testing is.
  + Went over the double examples

#### Linearithmic/ Loglinear
  + Merge Sort vs Binary Search, why are these complexities different?

#### Other
  + do we care about space complexity today?
  + do we need to learn about xor?

---

## 7/24/2016
Lecturer: Anthony Ladson

### Questions

* How can you tell if something is logarithmic?
* Difference between space complexity and time complexity?
* How does XOR work?
* Analysis question - what if we were dividing by something other than two at each level - how much work is being done on each level and what is the factor that determines when we need to go to a new layer? 	
* Why is merge sort not linear?
* What is quicksort?

### Notes

 * Quiz uses term "linearithmic" which is not mentioned in the videos

--------------------------------------------------------------------------------
