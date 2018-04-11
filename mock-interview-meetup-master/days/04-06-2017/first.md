### Whiteboard Problem
I opened up a dictionary to a page in the middle and started flipping through, looking for words I didn't know. I put each word I didn't know at increasing indices in a huge array I created in memory. When I reached the end of the dictionary, I started from the beginning and did the same thing until I reached the page I started at.

Now I have an array of words that are mostly alphabetical, except they start somewhere in the middle of the alphabet, reach the end, and then start from the beginning of the alphabet. In other words, this is an alphabetically ordered array that has been "rotated."

Write a function for finding the index of the "rotation point."

Here's an example: (don't give out to interviewee; let them come up with examples and allow them to come up with their own correct inputs and outputs)

```ruby
words = [
  'ptolemaic',
  'retrograde',
  'supplant',
  'undulate',
  'xenoepist',
  'asymptote', # <-- rotates here!
  'babka',
  'banoffee',
  'engender',
  'karpatka',
  'othellolagkage',
]
```

#### Solution
This is a modified version of binary search. At each iteration, we go right if the item we're looking at is greater than the first item and we go left if the item we're looking at is less than the first item.

We keep track of the lower and upper bounds on the rotation point, calling them floor_index and ceiling_index (initially we called them "floor" and "ceiling," but because we didn't imply the type in the name we got confused and created bugs). When floor_index and ceiling_index are directly next to each other, we know the floor is the last item we added before starting from the beginning of the dictionary, and the ceiling is the first item we added after.

```ruby
def find_rotation_point(words)

  first_word = words[0]

  floor_index = 0
  ceiling_index = words.length - 1

  while floor_index < ceiling_index

      # guess a point halfway between floor and ceiling
      guess_index = floor_index + ((ceiling_index - floor_index) / 2)

      # if guess comes after first word or is the first word
      if words[guess_index] >= first_word
          # go right
          floor_index = guess_index
      else
          # go left
          ceiling_index = guess_index
      end

      # if floor and ceiling have converged
      if floor_index + 1 == ceiling_index

          # between floor and ceiling is where we flipped to the beginning
          # so ceiling is alphabetically first
          return ceiling_index
      end
  end
end
```

#### Key takeaways to discuss during the debrief

This is a great example of the difference between "knowing" something and knowing something. You might have seen binary search before, but that doesn't help you much unless you've learned the lessons of binary search.

Binary search teaches us that when an array is sorted or mostly sorted:

* The value at a given index tells us a lot about what's to the left and what's to the right.
* We don't have to look at every item in the array. By inspecting the middle item, we can "rule out" half of the array.
* We can use this approach over and over, cutting the problem in half until we have the answer. This is sometimes called "divide and conquer."

**Whenever you know an array is sorted or almost sorted, think about these lessons from binary search and see if they apply.**
