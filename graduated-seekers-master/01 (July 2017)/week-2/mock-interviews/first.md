# Partner A interviews Partner B

## Personal Pitch (1.5 minutes)
Tell me about yourself.

## Lightning Round (10 minutes)
For this portion of the interview, we're going to do something called a "lightning round". We'll go through 5 different questions that covers a variety of topics. The main purpose is to get a gauge on the breadth/depth of your programming knowledge. If you don't know something, feel free to just say so.

1. [What's an API?](https://readwrite.com/2013/09/19/api-defined/)
2. [Explain OAuth.](https://blog.varonis.com/introduction-to-oauth/)
3. [What is key indexing in sql and how does it help?](https://stackoverflow.com/questions/1108/how-does-database-indexing-work)
4. Part 1: [What are the different scopes available in javascript?](https://www.w3schools.com/js/js_scope.asp)
4. Part 2: [How has this changed from ES5 to ES6?](https://www.sitepoint.com/joys-block-scoping-es6/)
5. [What are some other key differences between ES5 and ES6?](https://webapplog.com/es6/)

## JavaScript (10 minutes)
What does `bind` do in JavaScript? Please implement `Function.prototype.bind`. Feel free
to use other built-in JavaScript methods.

Answer to what bind does: https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_objects/Function/bind

Implementation of `Function.prototype.bind`:

```js

Function.prototype.bind = function(obj, ...args) {
	return () => {
		return this.apply(obj, args);
	};
}

```

Potential test case to make sure your implementation of `bind` is working:

```js
function foo(something) {
	console.log(`My fav number is ${this.a}`);
	console.log(`My second fav number is ${something}`);
	return this.a + something;
};

var obj = {
	a: 2
};

var bar = foo.bind(obj,3);

var b = bar(); // 'My fav number is 2'
               // 'My second fav number is 3'

console.log(b); // 5
      
```

## Whiteboarding (35 minutes)

**[Problem from Leetcode]**

Median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value. So the median is the mean of the two middle value.

Examples:
```
[2,3,4] , the median is 3

[2,3], the median is (2 + 3) / 2 = 2.5
```

Design a data structure, `MedianFinder` that supports the following two operations:

`insert(num)` - Add a integer number from the data stream to the data structure.
`find_median` - Return the median of all elements so far.

For example:
```
insert(1)
insert(2)
find_median -> 1.5
insert(3)
find_median -> 2
```

**Note to the interviewer:** This is a problem where you should push the interviewee
to not settle for a suboptimal solution.

### Solution

#### Naive Solution
Store the numbers in an array. Every time you need to output the median, sort the array and output the median.

Time complexity: O(nlog(n))
Space complexity: O(n)

#### A little better

Use insertion sort: When a new number comes, we add the number to the correct place in the already sorted list by using binary search. Once position is found, we need to shift all higher elements by one space to make room for the incoming number.

```ruby
class MedianFinder
	def initialize
		@store = []
	end

	def insert(num)
		if @store.empty?
			@store << num
		else
			# find correct index to insert into
			correct_index = @store.bsearch_index { |x| x >= num }

			if correct_index.nil?
				correct_index = @store.length
			end

			#shift all elements after correct index down 1
			(@store.length).downto(correct_index) do |index|
				@store[index] = @store[index - 1]
			end

			# insert num into the correct index
			@store[correct_index] = num
		end

		@store
	end

	def find_median
		store_length = @store.length
		if store_length % 2 == 1
			@store[store_length / 2]
		else
			second_mid = store_length / 2
			first_mid = second_mid - 1
			((@store[first_mid] + @store[second_mid]).to_f) / 2
		end
	end
end
```

Time Complexity: O(n) because while binary search takes O(log(n)), insertion can
take up to O(n) time to shift all subsequent elements down.

Space complexity: O(n) to hold all inputs in the store.

#### Optimal Solution

Heaps are a natural solution for this problem. Adding elements to them take logarithmic order of time. They also give direct access to the maximal/minimal elements in a group.

If we could maintain two heaps in the following way:

1. A max-heap to store the smaller half of the input numbers
2. A min-heap to store the larger half of the input numbers
This gives access to median values in the input: they comprise the top of the heaps!

If the following conditions are met:

* The number of elements in each heap never differ by more than 1
* The max-heap contains all the smaller numbers while the min-heap contains all the larger numbers

then we can say that:

* All the numbers in the max-heap are smaller or equal to the top element of the max-heap (let's call it `x`)
* All the numbers in the min-heap are larger or equal to the top element of the min-heap (let's call it `y`)

Then `x` and/or `y` are smaller than (or equal to) almost half of the elements and larger than (or equal to) the other half. That is the definition of median elements.

This leads us to a huge point of pain in this approach: keeping the difference in number of elements in the 2 heaps less than or equal to 1 at all times. For simplicity's sake, we'll refer to this as "keeping the two heaps balanced".

**Here's the algorithm for this approach:**

* Two priority queues:
	1. A max-heap `low` to store the smaller half of the numbers
	2. A min-heap `high` to store the larger half of the numbers
* The max-heap `low` is allowed to store, at worst, one more element than the min-heap `high`. Hence if we have processed `k` elements:
	* If `k` is odd, then `low` is allowed to hold 1 more element than `high`.
	* If `k` is even, then both heaps are balanced and hold the same amount of elements.

This gives us the nice property that when the heaps are perfectly balanced, the median can be derived from the tops of both heaps. Otherwise, the top of the max-heap `low` holds the legitimate median.

* Inserting a number `num`:
	* Add `num` to max-heap `low`. Since `low` received a new element, we must do a balancing step for `high`. So remove the largest element from `low` and move it to `high`.
	* The min-heap `high` might end holding more elements than the max-heap `low`, after the previous operation. We fix that by removing the smallest element from `high` and moving it to `low`.

The above step ensures that we do not disturb the nice little property that we just mentioned that comes as a result of the heaps being "balanced".

```ruby
class MedianFinder
	def initialize
		# For this problem, we're going to make the assumption that we have these Heap
		# classes built out and skip the actual implementation of them.
	  # However, you should be prepared to talk through how you would
		# implement a Heap with your interviewer just in case your interviewer
		# wants you to build a Heap class from scratch.
		# For example, in this situation, you should at the very least clarify
		# what methods exist on each heap class and how they work.
		# The MinHeap class will have #insert (which inserts element while maintaining
		# the heap property), #extract (which pops off the smallest element), and #min (which
		# shows the minimum element in the class). The MaxHeap class will have #insert,
		# #extract (which pops off the largest element), and #max (which shows the maximum
		# element in the class)
		@high = MinHeap.new
		@low = MaxHeap.new
	end

	def insert(num)
		# insert into low (which is a MaxHeap) and then transfer low's max element
		# to high (whih is a MinHeap)
		@low.insert(num)
		@high.insert(@low.max)
		@low.extract

		# if low is smaller than high, then transfer high's min element into low
		if @low.size < @high.size
			@low.insert(@high.min)
			@high.extract
		end
	end

	def find_median
		# if number of elements processed is odd, then @low's maximum element is the
		# median. If number of elements processed is even, then take the average of
		# @low's maximum and @high's minimum.
		if (@low.size + @high.size) % 2 == 1
			@low.max
		else
			(@low.max + @high.min) / 2
		end
	end
end
```

If the above solution is not immediately clear, try walking through it with the
follow example:

```
Adding number 41
MaxHeap lo: [41]           // MaxHeap stores the largest value at the top (index 0)
MinHeap hi: []             // MinHeap stores the smallest value at the top (index 0)
Median is 41
=======================
Adding number 35
MaxHeap lo: [35]
MinHeap hi: [41]
Median is 38
=======================
Adding number 62
MaxHeap lo: [41, 35]
MinHeap hi: [62]
Median is 41
=======================
Adding number 4
MaxHeap lo: [35, 4]
MinHeap hi: [41, 62]
Median is 38
=======================
Adding number 97
MaxHeap lo: [41, 35, 4]
MinHeap hi: [62, 97]
Median is 41
=======================
Adding number 108
MaxHeap lo: [41, 35, 4]
MinHeap hi: [62, 97, 108]
Median is 51.5
```


Time complexity: O(5 * log(n)) + O(1), which is O(log(n))
* At worst, there are three heap insertions and two heap deletions from the top of the heap. Each of these takes about O(log(n)) time.
* Finding the mean takes constant O(1) time since the tops of heaps are directly accessible.

Space complexity: O(n) linear space to hold input in container heaps.

For other potential solutions, visit: https://leetcode.com/problems/find-median-from-data-stream/#/solution
