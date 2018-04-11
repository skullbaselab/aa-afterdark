# What is big-O?
* We would like to be able to estimate and compare the running times of
  different algorithms
* Graphs from www.desmos.com/calculator
  - graph the sorting_demo.rb (modified for more data points)
    - extrapolate the running time of bubble sort for 50000 elements
* Estimate run time based on time complexity and previous run time
  - find constant
    - gets more consistent as n gets larger
  - extrapolate

## Theoretical basis for big-O
  - mathematical definition
  - interpretation is that it's worst-case
  - similarly, big-omega is best-case (don't go into details)
  - if something is both worst and best case, it's big-theta
    - eg, merge sort

## Insertion sort play-acting and demo:
  * Merge sort is a non-adaptive sort; always n * ln(n)
  * Insertion sort has a different worst case and best case
    - race demo both with volunteers
  * Bubble sort has same best and worst times as insertion sort

## Average time complexity
  * quick sort is n * ln(n) on average
    - walk through in detail
    - but worst case is n ^ 2

## Amortized running time
  * dynamic arrays
  * always average, but average is not always amortized

## Review
  * worst case (big-O)
  * best case
  * average case
  * big-theta
  * amortized running time

# Take away
  * Reducing time complexity is what's important; other optimizations are
    not going to matter much in practice for large n
    - Exceptions:
      - It can also be useful to reduce the constant multiplier for the largest
        term. Twice as fast is still twice as fast.
      - You will run into cases when n isn't large
        - practically, it's a good idea to use insertion sort in your quick sort
          once the arrays are small enough
  * But overall, we care about reducing time complexity!
