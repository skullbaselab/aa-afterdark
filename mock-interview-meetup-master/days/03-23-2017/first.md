#### JavaScript Problem
We're building a web game where everybody wins, and we are all friends forever.

You click on one of three boxes to see what nice thing you've won. You always win something nice.

Here's what we have so far. Something's wrong. Can you tell what it is and then fix it?

```html
<button id="btn-0">Button 1!</button>
<button id="btn-1">Button 2!</button>
<button id="btn-2">Button 3!</button>

<script type="text/javascript">
var prizes = ['A Unicorn!', 'A Hug!', 'Fresh Laundry!'];
for (var btnNum = 0; btnNum < prizes.length; btnNum++) {
  // for each of our buttons, when the user clicks it...
  document.getElementById('btn-' + btnNum).onclick = function() {
    // tell her what she's won!
    alert(prizes[btnNum]);
  };
}
</script>
```
The syntax is fine -the problem is some unexpected behavior.

##### Solution
The user's prize is always undefined.

The anonymous function we're assigning to the buttons' `onclicks` has access to variables in the scope outside of it (closure). In this case, it has access to `btnNum`.

**When a function accesses a variable outside its scope, it accesses that variable, not a frozen copy.** So when the value held by the variable changes, the function gets that new value. By the time the user starts pressing buttons, our loop will have already completed and `btnNum` will be 3, so this is what each of our anonymous functions will get for `btnNum`.

**Why 3?** The loop will increment `btnNum` until the conditional in the middle is no longer met -that is, until it's not true that `btnNum` < `prizes.length`. So the code in the for loop won't run with `btnNum = 3`, but `btnNum` will be 3 when the loop is done.

We can solve this by wrapping our anonymous function in another anonymous function that takes `btnNum` as an argument.

```html
<button id="btn-0">Button 1!</button>
<button id="btn-1">Button 2!</button>
<button id="btn-2">Button 3!</button>

<script type="text/javascript">
var prizes = ['A Unicorn!', 'A Hug!', 'Fresh Laundry!'];
for (var btnNum = 0; btnNum < prizes.length; btnNum++) {
  // for each of our buttons, when the user clicks it...
  document.getElementById('btn-' + btnNum).onclick = function(frozenBtnNum){
    return function() {
      // tell her what she's won!
      alert(prizes[frozenBtnNum]);
    };
  }(btnNum); // LOOK! We're passing btnNum to our anonymous function here!
  }
  </script>
  ```
  This "freezes" the value of `btnNum`.

  `btnNum` is a number, which is a primitive type in JavaScript.

  Primitives are "simple" data types (string, number, boolean, null, and undefined in JavaScript). Everything else is an object in JavaScript (functions, arrays, Date() vlues, etc.).

  One important property of primitives in JS is that when they are passed as arguments to a function, they are copied ("passed by value"). So for example:

  ```javascript
  var threatLevel = 1;

  function inspireFear(threatLevel){
  threatLevel += 100;
  }

  inspireFear(threatLevel);
  console.log(threatLevel); // Whoops! It's still 1!
  ```

  The threatLevel inside inspireFear() is a new number, initialized to the same value as the threatLevel outside of inspireFear(). Giving these different variables the same name might cause confusion here. If we change the two variables to have different names we get the exact same behavior:

  ```javascript
  var threatLevel = 1;

  function inspireFear(theThreatLevel){
  theThreatLevel += 100;
  }

  inspireFear(threatLevel);
  console.log(threatLevel); // Whoops! It's still 1!
  ```

  In contrast, when a function takes an object, it takes a **reference** to that object, so changes you make to the object in the function persists after the function is done running. This is someties called a side effect.

  ```javascript
  var scaryThings = ['spiders', 'Cruella de Vil'];

  function inspireFear(scaryThings){
  scaryThings.push('nobody will hire me');
  scaryThings.push('i should have gotten a real job');
  scaryThings.push('why am i doing this to myself');
  }

  inspireFear(scaryThings);
  console.log(scaryThings);
  // ['spiders', 'Cruella de Vil', 'nobody will hire me', 'i should have gotten a real job', 'why am i doing this to myself']
  ```
  Back to our solution:
  ```html
  <button id="btn-0">Button 1!</button>
  <button id="btn-1">Button 2!</button>
  <button id="btn-2">Button 3!</button>

  <script type="text/javascript">
  var prizes = ['A Unicorn!', 'A Hug!', 'Fresh Laundry!'];
  for (var btnNum = 0; btnNum < prizes.length; btnNum++) {
  // for each of our buttons, when the user clicks it...
  document.getElementById('btn-' + btnNum).onclick = function(frozenBtnNum){
  return function() {
  // tell her what she's won!
  alert(prizes[frozenBtnNum]);
  };
  }(btnNum);
  }
  </script>
  ```
  So when we pass btnNum to the outer anonymous function as its one argument, we create a new number inside the outer anonymous function called frozenBtnNum that has the value that btnNum had at that moment (0, 1, or 2).

  Our inner anonymous function is still a closure because it still reaches outside its scope, but now it closes over this new number called frozenBtnNum, whose value will not change as we iterate through our for loop.

#### Whiteboarding Problem
Given an array of integers, find the highest product you can get from three of the integers. The input array_of_ints will always have at least three integers.

Hint (don't provide unless they're stuck or clarify): Does your function work with negative numbers? If array_of_ints is [-10, -10, 1, 3, 2] we should return 300 (which we get by taking -10 * -10 * 3).

##### Solution
Sorting the array would let us grab the highest numbers quickly, so it might be a good first step. Sorting takes O(nlogn) time. That's better than the O(n^3) time a brute force approach requireds, but we can still do better.

Since we know we must spend at least O(n) time, let's see if we can solve it in exactly O(n) time.

A great way to get O(n) runtime is to use a greedy approach: How can we keep track of the highest_product_of_3 "so far" as we do one walk through the array?

Put differently, for each new current number during our iteration, how do we know if it gives us a new highest_product_of_3?

We have a new highest_product_of_3 if the current number times two other numbers gives a product that's higher than our current highest_product_of_3. What must we keep track of at each step so that we know if the current number times two other numbers gives us a new highest_product_of_3?

Our first guess might be:

1. our current highest_product_of_3
2. the three_numbers_which_give_highest_product

But consider this example:

```ruby
  array_of_ints = [1, 10, -5, 1, -100]
```

Right before we hit -100 (so, in our second-to-last iteration), our highest_product_of_3 was 10, and the three_numbers_which_give_highest_product were [10,1,1]. But once we hit -100, suddenly we can take -100 x -5 x 10 to get 5000. So we should have "held on to" that -5, even though it wasn't one of the three_numbers_which_give_highest_product.

We need something a little smarter than three_numbers_which_give_highest_product. What should we keep track of to make sure we can handle a case like this?

There are at least two great answers:
1. Keep track of the highest_2 and lowest_2 (most negative) numbers. If the current number times some combination of those is higher than the current highest_product_of_3, we have a new highest_product_of_3!
2. Keep track of the highest_product_of_2 and lowest_product_of_2 (could be a low negative number). If the current number times one of those is higher than the current highest_product_of_3, we have a new highest_product_of_3!

We'll go with (2). It ends up being slightly cleaner than (1), though they both work just fine.

How do we keep track of the highest_product_of_2 and lowest_product_of_2 at each iteration? (Hint: we may need to also keep track of something else.)

We also keep track of the lowest number and highest number. If the current number times the current highest—or the current lowest, if current is negative—is greater than the current highest_product_of_2, we have a new highest_product_of_2. Same for lowest_product_of_2.

So at each iteration we're keeping track of and updating:

- highest_product_of_3
- highest_product_of_2
- highest
- lowest_product_of_2
- lowest

```ruby
def highest_product_of_3(array_of_ints)
  if array_of_ints.length < 3
      raise Exception, 'Less than 3 items!'
  end

  # We're going to start at the 3rd item (at index 2)
  # so pre-populate highests and lowests based on the first 2 items.
  # we could also start these as nil and check below if they're set
  # but this is arguably cleaner
  highest = [array_of_ints[0], array_of_ints[1]].max
  lowest =  [array_of_ints[0], array_of_ints[1]].min

  highest_product_of_2 = array_of_ints[0] * array_of_ints[1]
  lowest_product_of_2  = array_of_ints[0] * array_of_ints[1]

  # except this one--we pre-populate it for the first *3* items.
  # this means in our first pass it'll check against itself, which is fine.
  highest_product_of_3 = array_of_ints[0] * array_of_ints[1] * array_of_ints[2]

  # walk through items, starting at index 2
  # (we could slice the array but that would use n space)
  array_of_ints.each_with_index do |current, index|
      next if index < 2

      # do we have a new highest product of 3?
      # it's either the current highest,
      # or the current times the highest product of two
      # or the current times the lowest product of two
      highest_product_of_3 = [
          highest_product_of_3,
          current * highest_product_of_2,
          current * lowest_product_of_2
      ].max

      # do we have a new highest product of two?
      highest_product_of_2 = [
          highest_product_of_2,
          current * highest,
          current * lowest
      ].max

      # do we have a new lowest product of two?
      lowest_product_of_2 = [
          lowest_product_of_2,
          current * highest,
          current * lowest
      ].min

      # do we have a new highest?
      highest = [highest, current].max

      # do we have a new lowest?
      lowest = [lowest, current].min
  end

  return highest_product_of_3
end
```

Time complexity is O(n), and space is O(1).

Big takeaway: Using a greedy algorithm-
A greedy algorithm iterates through the problem space taking the optimal solution "so far," until it reaches the end.

The greedy approach is only optimal if the problem has "optimal substructure," which means stitching together optimal solutions to subproblems yields an optimal solution.
