# Binary Search

1) How does it work?
2) The Code


## How does it work?
* Binary search has two arguments: a sorted array and a target element.
* Binary search will compare the target element with the element at the middle of the array.
    * If the target element is less than the middle of the array ==> continue searching on the left hand side of the array.
    * If the target element is equal to the element at the middle of the array ==> return the index!
    * If the target element is more than the middle of the array ==> continue searching on the right hand side of the array.
* Binary search Time Complexity: O(log n)
* Space Complexity: O(1)

```ruby
  bsearch([1,2,3,4,6], 5)   
```
Let's say we started with an array [1, 2, 3, 4, 5] with the target of 5.
What index of 5 in the sorted array?

1) `sorted_arr = [1, 2, 3, 4, 5]`
`arr_length = 5`
`mid_i = 2`
`arr[mid_i] = 3`

   let's compare the arr @ mid_i with target. 3 < 5
   Target may be in the second half of the array. Let's search the left side of the array!

2) `leftside_arr = [4, 5]`
`offset = 3` this array starts at the 3rd position of the original array.
`arr_length = 2`
`mid_i = 1`
`arr[mid_i] = 1`

    let's compare the arr @ mid_i with target. 5 == 5
    Target was found at the current mid_i which 1. However, This leftover_arr started at the 3rd position of the original array. Therefore 3 + 1 = 4. 5 is located at the 4th index.



## Code

```
def bsearch(array, target)
  return nil if array.empty?

  mid_i = array.length / 2

  return mid_i if array[mid_i] == target

  if array[mid_i] > target
    bsearch(array[0...mid_i], target)
  else
    sub_answer = bsearch(array[mid_i + 1..-1], target)
    sub_answer.nil? ? nil : (mid_i + 1) + sub_answer
  end

end
```
