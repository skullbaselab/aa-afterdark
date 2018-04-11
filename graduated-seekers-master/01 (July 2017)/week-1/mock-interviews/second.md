# Partner B interviews Partner A

## Personal Pitch (1.5 minutes)
Walk me through your resume.

## Lightning Round (10 minutes)
For this portion of the interview, we're going to do something called a "lightning round". We'll go through 9 different questions that covers a variety of topics. The main purpose is to get a gauge on the breadth/depth of your programming knowledge. If you don't know something, feel free to just say so.

1. [How does asynchronicity work in JS?](https://github.com/appacademy/curriculum/blob/master/javascript/readings/asynchronous-js.md)
2. [Describe the difference between a cookie, sessionStorage and localStorage.](https://stackoverflow.com/questions/29960037/localstorage-vs-sessionstorage-vs-cookies)
3. What's a language you don't like and why?
4. [What does box sizing do in CSS?](http://blog.teamtreehouse.com/box-sizing-secret-simple-css-layouts)
5. [Name as many of the lifecycle methods in React as you can think of. Give a brief description of each.](https://facebook.github.io/react/docs/react-component.html)
6. [What is a single point of failure in regards to web architecture?](https://medium.com/on-coding/web-application-architecture-bca09ce0fabe)
7. [What's a CDN and what are the advantages and disadvantages of using one?](https://github.com/donnemartin/system-design-primer#content-delivery-network)
8. [What's a higher order component in React? What's its purpose?](https://facebook.github.io/react/docs/higher-order-components.html)
9. [What is Node.js?](https://www.tutorialspoint.com/nodejs/nodejs_introduction.htm)

## Whiteboarding (20 minutes)

(**Taken from LeetCode**)

Given an unsorted array of integers, find the length of the longest consecutive elements sequence.

For example:
```
Given [100, 4, 200, 1, 3, 2],
The longest consecutive elements sequence is [1, 2, 3, 4]. 

Return its length: 4.
```

### Solution
First turn the input into a set of numbers. That takes O(n) and then we can ask in O(1) whether we have a certain number.

Then go through the numbers. If the number x is the start of a streak (i.e., x-1 is not in the set), then test y = x+1, x+2, x+3, ... and stop at the first number y not in the set. The length of the streak is then simply y-x and we update our global best with that. Since we check each streak only once, this is overall O(n). 

```ruby
require 'set'

def longest_consecutive(nums)
	nums_set = nums.to_set
	best = 0

	nums_set.each do |x|
		if !nums_set.include?(x - 1)
			y = x + 1
			while nums_set.include?(y)
				y += 1
			end
			best = [best, y - x].max
		end
	end

	best
end
```
