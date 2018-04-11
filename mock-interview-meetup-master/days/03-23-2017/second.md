#### JavaScript Problem
If we execute this JavaScript, what will the browser's console show?

```javascript
var text = 'outside';
function logIt(){
  console.log(text);
  var text = 'inside';
};
logIt();
```

##### Solution
The console will log undefined.

To understand this, we need to explain a few things about Javascript.

Function-level scope: Functions create new scopes in Javascript:

```javascript
function setVar(){
    // inside this function we have a new scope
    // so this variable, declared in this function's scope, won't be available outside the function
    var varInFunction = 'inside a function';
}
setVar();
console.log(varInFunction);  // throws 'ReferenceError: varInFunction is not defined'
```
Blocks like if statements and for loops do not create a new scope (this is also true of Python and recent versions of Ruby, but untrue of Java and C):

```javascript
if (true) {
    // this if statement doesn't create a new scope
    // so varInIf is available in the global scope
    var varInIf = 'inside an if statement';
}
console.log(varInIf);  // logs 'inside an if statement'
```

Declaration vs. assignment: A variable declaration simply tells the interpreter that a variable exists. By default it initializes the variable to undefined:

```javascript
var unicorn;
console.log(unicorn);  // logs undefined (NOT a ReferenceError)
```

A variable assignment assigns a value to the variable:

```javascript
unicorn = 'Sparkles McGiggleton';
```

We can declare and assign in the same line:
```javascript
var centaur = 'Horsey McPersonhead';
```

**Hoisting: ** In Javascript, variable declarations are "hoisted" to the top of the current scope. Variable assignments, however, are not.

So returning to the original problem, the declaration (but not the assignment) of text gets hoisted to the top of logIt(). So our code gets interpreted as though it were:

```javascript
var text = 'outside';
function logIt(){
  var text;
  console.log(text);
  text = 'inside';
};
logIt();
```
So we have a new variable text inside of logIt() that is initialized to undefined, which is what it holds when we hit our log statement.


Recap: when you declare a variable in JavaScript (using "var"), that variable declaration is "hoisted" to the top of the current scope—meaning the top of the current function or the top of the script if the variable isn't in a function.

Hoisting can cause unexpected behavior, so a good way to keep things clear is to always declare your variables at the top of the scope.

#### Whiteboarding Problem
Your company built an in-house calendar tool called HiCal. You want to add a feature to see the times in a day when everyone is available.
To do this, you’ll need to know when any team is having a meeting. In HiCal, a meeting is stored as arrays of integers [start_time, end_time] . These integers represent the number of 30-minute blocks past 9:00am.

For example:

```ruby
[2, 3] # meeting from 10:00 – 10:30 am
[6, 9] # meeting from 12:00 – 1:30 pm
```
Write a function merge_ranges() that takes an array of meeting time ranges and returns an array of condensed ranges.

For example, given:

```ruby
[ [0, 1], [3, 5], [4, 8], [10, 12], [9, 10] ]
```

your function would return:

```ruby
[ [0, 1], [3, 8], [9, 12] ]
```

Do not assume the meetings are in order. The meeting times are coming from multiple teams.

Write a solution that's efficient even when we can't put a nice upper bound on the numbers representing our time ranges. Here we've simplified our times down to the number of 30-minute slots past 9:00 am. But we want the function to work even for very large numbers, like Unix timestamps. In any case, the spirit of the challenge is to merge meetings where start_time and end_time don't have an upper bound.

Some potential edge cases:

```ruby
  [ [1, 2], [2, 3] ]
```
- These meetings should probably be merged, although they don't exactly "overlap"—they just "touch." Does your function do this?

```ruby
[ [1, 5], [2, 3] ]
```
- Notice that although the second meeting starts later, it ends before the first meeting ends. Does your function correctly handle the case where a later meeting is "subsumed by" an earlier meeting?

```ruby
[ [1, 10], [2, 6], [3, 5], [7, 9] ]
```
-Here all of our meetings should be merged together into just [1, 10]. We need keep in mind that after we've merged the first two we're not done with the result—the result of that merge may itself need to be merged into other meetings as well.

Make sure that your function won't "leave out" the last meeting.

##### Solution

**Detailed breakdown:**
What if we only had two ranges? Let's take:
```ruby
  [ [1, 3], [2, 4] ]
```
These meetings clearly overlap, so we should merge them to give:
```ruby
  [ [1, 4] ]
```
But how did we know that these meetings overlap?

We could tell the meetings overlapped because the end time of the first one was after the start time of the second one! But our ideas of "first" and "second" are important here—this only works after we ensure that we treat the meeting that starts earlier as the "first" one.

How would we formalize this as an algorithm? Be sure to consider these edge cases:

The end time of the first meeting and the start time of the second meeting are equal. For example: [ [1, 2], [2, 3] ]
The second meeting ends before the first meeting ends. For example: [ [1, 5], [2, 3] ]

Here's a formal algorithm:
1. We treat the meeting with earlier start time as "first," and the other as "second."
2. If the end time of the first meeting is equal to or greater than the start time of the second meeting, we merge the two meetings into one time range. The resulting time range's start time is the first meeting's start, and its end time is the later of the two meetings' end times.
3. Else, we leave them separate.

So, we could compare every meeting to every other meeting in this way, merging them or leaving them separate.

Comparing all pairs of meetings would take O(n^2) time. We can do better!

If we're going to beat O(n^2) time, maybe we're going to get O(n) time? Is there a way to do this in one pass?

It'd be great if, for each meeting, we could just try to merge it with the next meeting. But that's definitely not sufficient, because the ordering of our meetings is random. There might be a non-next meeting that the current meeting could be merged with.

What if we sorted our array of meetings by start time?

Then any meetings that could be merged would always be adjacent!

So we could sort our meetings, then walk through the sorted array and see if each meeting can be merged with the one after it.

Sorting takes O(nlogn) time in the worst case. If we can then do the merging in one pass, that's another O(n) time, for O(nlogn) overall. That's not as good as O(n), but it's better than O(n^2)!

**Solution:**
First, we sort our input array of meetings by start time so any meetings that might need to be merged are now next to each other.

Then we walk through our sorted meetings from left to right. At each step, either:

1. We can merge the current meeting with the previous one, so we do.
2. We can't merge the current meeting with the previous one, so we know the previous meeting can't be merged with any future meetings and we throw the current meeting into merged_meetings.

```ruby
def merge_ranges(meetings)

  # sort by start times
  sorted_meetings = meetings.sort

  # initialize merged_meetings with the earliest meeting
  merged_meetings = [sorted_meetings[0]]

  sorted_meetings[1..-1].each do |current_meeting_start, current_meeting_end|

      last_merged_meeting_start, last_merged_meeting_end = merged_meetings[-1]

      # if the current and last meetings overlap, use the latest end time
      if current_meeting_start <= last_merged_meeting_end
          merged_meetings[-1] = [last_merged_meeting_start, [last_merged_meeting_end, current_meeting_end].max]

      # add the current meeting since it doesn't overlap
      else
          merged_meetings.push([current_meeting_start, current_meeting_end])
      end
  end

  return merged_meetings
end
```

##### Complexity
O(nlogn) time and O(n) space.

Even though we only walk through our array of meetings once to merge them, we sort all the meetings first, giving us a runtime of O(nlogn). It's worth noting that if our input were sorted, we could skip the sort and do this in O(n) time!

We create a new array of merged meeting times. In the worst case, none of the meetings overlap, giving us an array identical to the input array . Thus we have a worst-case space cost of O(n).
