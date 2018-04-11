# Partne A interviews Partner B

## Personal Pitch (1.5 minutes)
Tell me about yourself.

## Lightning Round (10 minutes)
For this portion of the interview, we're going to do something called a "lightning round". We'll go through 9 different questions that covers a variety of topics. The main purpose is to get a gauge on the breadth/depth of your programming knowledge. If you don't know something, feel free to just say so.

1. [Talk about the 4 types of positions in CSS.](https://www.w3schools.com/css/css_positioning.asp)
2. [What is HTTPS, and how is it different from HTTP?](https://www.instantssl.com/ssl-certificate-products/https.html)
3. [What's a ring buffer?](https://en.wikipedia.org/wiki/Circular_buffer)
4. What's your favorite thing about your favorite language? What's your least favorite thing about your favorite language?
5. [What's a load balancer?](https://www.nginx.com/resources/glossary/load-balancing/)
6. [What does responsive mean in terms of web pages?](https://www.smashingmagazine.com/2011/01/guidelines-for-responsive-web-design/)
7. [What's a hashmap vs hash table?](http://beginnersbook.com/2014/06/difference-between-hashmap-and-hashtable/)
8. [What is XSS and CSRF? what are the differences between the two?](https://security.stackexchange.com/questions/138987/difference-between-xss-and-csrf)
9. [Tell me about the Event Loop in JS.](http://blog.carbonfive.com/2013/10/27/the-javascript-event-loop-explained/)

## Whiteboarding (20 minutes)

(**Taken from LeetCode**)

Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.

For "(()", the longest valid parentheses substring is "()", which has length = 2.

Another example is ")()())", where the longest valid parentheses substring is "()()", which has length = 4.

### O(n) Solution

1. Scan the string from beginning to end.
2. If current character is '(', push its index to the stack. If current character is ')' and the character at the index of the top of stack is '(', we just find a matching pair so pop from the stack. Otherwise, we push the index of ')' to the stack.
3. After the scan is done, the stack will only contain the indices of characters which cannot be matched. Then let's use the opposite side - substring between adjacent indices should be valid parentheses.
4. If the stack is empty, the whole input string is valid. Otherwise, we can scan the stack to get longest valid substring as described in step 3.

```ruby
def longestValidParentheses(string)
	longest = 0
	stack = []

	string.each_with_index do |char, index|
		if string[index] == '(' 
			stack << index 
		else
			if !stack.empty?
				string[stack.length - 1] == '(' ? stack.pop : stack.push(index)
			end
		end
	end

	if stack.empty?
		longest = string.length
	else
		a = string.length
		b = 0
		while !stack.empty?
			b = stack[stack.length - 1]
			stack.pop
			longest = [longest, a-b-1].max
			a = b
		end
		longest = [longest, a].max
	end

	longest
end 
```
