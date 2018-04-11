# Time Complexity Workshop

We're going to practice analyzing the time complexities of a few functions. This is a unique topic; you'll have to be able to conjure the time complexity of your code on the spot in interviews, and you'll be expected to do so without the benefit of Googling the basics (like "What is a logarithm?"). 

After you solve each problem, switch over to the [solutions][solutions] to make sure you got it right and to be sure that you understand before moving on!

### Arrays Are Awesome

Let's start with some array manipulation. Find the time complexity of each of the following functions (in order -- they depend on each other). You may assume that all arrays are arrays of integers, for convenience. When you evaluate time complexity, remember to do each of the following:

1. Specify which aspect (or aspects) of the input the time complexity depends on. E.g., if a function is `O(n)`, what is *n*?
2. Explain thoroughly and clearly *why* the time complexity is what it is.
3. Find the *worst* cases. 
3. Discuss space complexity too: this is usually deemphasized over time complexity, but some interviewers will ask about it.

**NB**: you can assume that any print statements (`console.log`, `puts`, etc.) run in constant time. We'll come back to this near the end, but this is also a safe assumption to make in interviews.

So, what's the time complexity of this function? Remember to find those constant factors as well as the overall time complexity, especially for these simple examples.

1.
```ruby
def add(a, b)
  if a > b
    return a + b
  end

  a - b
end

```


2.
```ruby
def print_arr_1(arr)
  arr.each do |el|
    puts el
  end
end
```
Great, two easy ones out of the way! Now, what happens when we add just one more line? What changes, and what stays the same? (Don't forget about those constant factors!)

3.
```ruby
def print_arr_2(arr)
  arr.each_with_index do |el, idx|
    break if idx == arr.length/2 - 1
    puts el
  end
end
```
Let's make another change, again asking ourselves how the time complexity is affected. 

4.
```ruby
def print_arr_3(arr)
  arr.each do |el|
    break if el == arr.length/2 - 1
    puts el
  end
end
```
Finally, let's add a little bit to our code. 

5.
```ruby
def print_arr_4(arr)
  arr.each do |el|
    break if el == arr.length/2 - 1
    puts el
  end

  arr.each_with_index do |el, idx|
    puts el if idx % 3 == 0
  end

  puts arr.last
end
```
Now let's make a bigger change.  Define a basic `search` function as follows:

6.
```ruby
def search(arr, target)
  arr.each_with_index do |el, idx|
    return idx if el == target
  end
end
```
Now, let's use this `search` within another function.  Determine the time complexity of the following:

7.
```ruby
def searchity_search(arr, target)
  results = []
  arr.each do |el|
    results << search(arr, target + el)
  end

  results  
end
```
You may have noted that the *nested* nature of `search` within the loop of this function affects this drastically. But not all loops are created equal. Think carefully about this one:

8.
```ruby
def searchity_search_2(arr, target)
  results = []
  arr.each do |el|
    results << search(arr, el)
  end

  results  
end
```


### Interacting with Iterativeness

Let's leave the arrays behind for a bit, and look at a few other functions.

1.
```javascript
let iterative_1 = (n, m) => {
  let notes = ["do", "rei", "mi", "fa", "so", "la", "ti", "do"];

  for (var i = 0; i < n; i++) {
    for (var j = 0; j < m; j++) {
      let position = (i+j) % 8;
      console.log(notes[position]);
    }
  }
}
```
How do things change when we make this subtle alteration?

2.
```javascript
let iterative_2 = (n) => {
  let notes = ["do", "rei", "mi", "fa", "so", "la", "ti", "do"];

  for (var i = 0; i < n; i++) {
    for (var j = i; j >= 0; j--) {
      let position = (i+j) % 8;
      console.log(notes[position]);
    }
  }
}
```
Now, let's combine both ideas. What's the time complexity of this function?

3.
```javascript
let iterative_3 = (n, m) => {
  let notes = ["do", "rei", "mi", "fa", "so", "la", "ti", "do"];

  let bigger = n > m ? n : m;
  let smaller = n <= m ? n : m;

  for (var i = 0; i < smaller; i++) {
    for (var j = i; j < bigger; j++) {
      let position = (i+j) % 8;
      console.log(notes[position]);
    }
  }
}
```

### Radical Recursion

Recursive functions are among the toughest to evaluate for time complexity. Remember **FFS**:

1. <b>F</b>ind the time complexity of *one call*, ignoring the recursive calls,
2. <b>F</b>ind the number of times the function is called, and, if necessary, the input sizes on all of those calls.
3. <b>S</b>um everything together.

Let's start with something nice and simple. Don't forget to find the constant factor! (As a bonus, figure out a better name for this function than `rec_mystery` -- what is it doing?)

```ruby
def rec_mystery(n)
  return n if n < 5

  rec_mystery(n - 5)
end
```
Let's change things ever so slightly.  Now what is the time complexity?

```ruby
def rec_mystery_2(n)
  return 0 if n == 0

  rec_mystery_2(n/5) + 1
end
```

Now let's add in a bit of complexity with some extra variables in the mix.

```java
void rec_mystery_3(int n, int m, int o)
{
  if (n <= 0)
  {
    printf("%d, %d\n", m, o);
  }
  else
  {
    rec_mystery_3(n-1, m+1, o);
    rec_mystery_3(n-1, m, o+1);
  }
}
```

The next one is a bit harder.

```ruby
class Array
  def grab_bag
    return [[]] if empty?
    bag = take(count - 1).grab_bag
    bag.concat(bag.map { |handful| handful + [last] })
  end
end
```

At this point, look over your notes and answers to make sure you understand how you've solved each question. Well done!

[solutions]: ./big_o_solutions.md


