# Partner B interviews Partner A (1 hour)

## Weak.

Tell me about three of your weakness.

## You're great and all, but...

We're really looking for someone with more experience...

Respond.


## Create Maximum Number, Part 1 (20 mins)

Given two arrays of integers, build the maximum number possible from all the input numbers without violating the internal order of either of the original arrays.

Example:
[1,3,2], [9,1,1] => 913211
[1,1,2,1], [1,1,1] => 1121111

### Solution

* Since we must use all the numbers without violating internal order, we can compare only the first numbers because otherwise we would eventually have to return to earlier in the list, which is not allowed.
* must account for what to do in the case of two of the same number: have to look ahead until you find non-matching numbers
* must account for when one of the lists becomes empty
* must account for when all numbers currently left in one list match the other list: have to compare the next number from the longer list to the first number from the shorter one

```ruby

def max_number(nums1, nums2)
  result = []
  until nums1.empty? || nums2.empty?
    i = 0
    while nums1[i] == nums2[i]
      i += 1 unless nums1[i].nil? || nums2[i].nil?
    end
    if nums1[i] && nums2[i]
      result << (nums1[i] <= nums2[i] ? nums2.shift : nums1.shift)
    else
      if nums1[i].nil?
        result << (nums2[i] > nums1[0] ? nums2.shift : nums1.shift)
      else
        result << (nums1[i] > nums2[0] ? nums1.shift : nums2.shift)
      end
    end
  end
  result.concat(nums1).concat(nums2).join.to_i
end

p max_number([1,3,5,6,6], [9,1,1]) == 91356611
p max_number([9,1,1], [1,3,5,6,6]) == 91356611
p max_number([1,1,1], [1,1,2,1]) == 1121111
p max_number([1,1,2,1], [1,1,1]) == 1121111
p max_number([1,1,2,1], [1,1,2]) == 1121121
p max_number([1,1,2], [1,1,2,1]) == 1121121
p max_number([1,1,2], [1,1,2,3]) == 1123112
p max_number([1,1,2,3], [1,1,2]) == 1123112

```

## Create Maximum Number, Part 2 (45 mins)

Now you will be provided with another parameter `k` that is the length of the result we want to build. The constraint about violating internal order still holds. Develop and code an algorithm that will do this.

Example: [1,3,5,6,6], [9,1,1], 4 => 9661

### Solution
The applicant should be creating different test cases to try to determine how correct solutions are built. They should be contrasting the difficulties of this implementation with the first problem.

Key insight: The correct result is found by finding the maximum max_merged result of a set of the largest numbers of a certain size

In the example, 9661 is the max_merge of 66 and 91, each of which is the largest integer of length 2 from its respective array. Other options included the max_merge of [6, 911], [566, 9], [3566, nil]. 9661 is the max of all these.

There are many ways you could go about coding this. Developing the procedure and algorithm is the primary importance of this exercise.

After 15 minutes, the interviewer should try to help the applicant arrive at the key insight.

If you are nearing the end of your time and the applicant hasn't reached a good solution, have them explain the following solution code:

```ruby

def find_max_combo(nums, k)
  drop = nums.size - k
  out = [9]
  nums.each do |num|
    while drop > 0 && out[-1] < num
      out.pop
      drop -= 1
    end
    out << num
  end
  out[1..k]
end

def max_number(nums1, nums2, k)
  ([k-nums2.size, 0].max .. [nums1.size, k].min).map { |k1|
    parts = [find_max_combo(nums1, k1), find_max_combo(nums2, k-k1)]
    (1..k).map { parts.max.shift }
  }.max.join.to_i
end

p max_number([1,3,5,6,6], [9,1,1], 4)
```

### Solution: Annotated

```ruby

def find_max_combo(nums, k)

  # drop will control the number of times that we can overwrite values
  # in our return array
  drop = nums.size - k

  # we include a dummy value in our return array so that we can use
  # out[-1] < num in our condition
  out = [9]

  # we iterate through our numbers
  nums.each do |num|

    # if we still have leeway (drop > 0) then we can overwrite
    while drop > 0 && out[-1] < num
      out.pop
      drop -= 1
    end

    # shovel 'overwrites' with or appends the next number
    out << num
  end

  # excluding the dummy number
  out[1..k]
end

def max_number(nums1, nums2, k)

  # generate an interval that accounts for the minimum number of elements
  # that will be needed from each array (basically the size of one array
  # dictates the number that can be dropped from the other), and map over it
  # (in the test case, the interval would be 1..4 (or 0..3 if the inputs were reversed))
  ([k-nums2.size, 0].max .. [nums1.size, k].min).map { |k1|

    # 1,3  2,2  3,1  4,0
    parts = [find_max_combo(nums1, k1), find_max_combo(nums2, k-k1)]

    # max_merge operation based on the behavior of #max
    (1..k).map { parts.max.shift }

  }.max.join.to_i # using the same #max behavior to select the final answer
end


p max_number([1,3,5,6,6], [9,1,1], 4)

```
