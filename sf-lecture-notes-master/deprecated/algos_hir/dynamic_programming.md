# Dynamic Programming

## Notes on Anthony's Lecture

### Dynamic Programming AKA:

+ Smart brute force
+ Trying all possibilities but not repeating yourself
+ Moving from exponential time to polynomial time

### Example: Fibonacci

For each recursive call, we calculate `fib` of the previous two numbers - which
means we're repeatedly calculating the same calls.

+ `fib(8)` --> `fib(7)` + `fib(6)`
  + `fib(7)` --> `fib(6)` + `fib(5)`
  + `fib(6)` --> `fib(5)` + `fib(4)`
+ Etc.

#### Top down approach. We start with the top of the recursion tree. So for `fib(8)`, we
start with `fib(8)`, then `fib(7)` and `fib(6)`, etc. But when we get to the second branch
of the tree, `fib(7)`, it's already stored.

Store (*memo-ize*) each sub-solution in an object.

```js
fib(n, mem = {}) {
  return 1 if n <= 2;

  if (!mem[n]) {
    mem[n] = fib(n - 1, mem) + fib(n - 2, mem);
  }

  return mem[n];
}
```

#### Array version. Bottom up.

```js
fib(n) {
  mem = [0, 1, 1];

  for (let i = 2; i <= n; i++)
 {
   mem[i] = mem[i - 1] + mem[1 - 2];
 }
  return mem[n]
}
```

Linear space complexity. Can be constant if you store only the previous two sub-sums:

```js
fib(n) {
  prev = [0, 1];
  if (n < 2) {
    return prev[n];
  }

  for (let i = 2; i <= n; i++)
 {
   next = prev[0] + prev[1];
   prev[0] = prev[1];
   prev[1] = next;
  }
  return prev[1];
}
```

### Tips

+ Draw a graph. What calls are being repeated? What is dependent on what?
+ Figure out the recurrence relation (~= sub problem)
+ Specify the order of evaluation

### Example: The Knapsack Problem

Knapsack has a capacity of 7.

Each item has a weight and value. We want to maximize value.

Item 1 --> W: 3, V: 4
Item 2 --> W: 5, V: 7
Item 3 --> W: 4, V: 5

Starting with an empty knapsack. Full capacity, 0 weight, 0 value.

One approach:
At each level we have the pick up or don't pick up option.

Another approach:
Matrix of options. Can build that matrix up in code.
