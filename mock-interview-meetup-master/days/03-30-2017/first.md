#### Build something problem
Using React, build a digital clock that displays the current (west coast) time (non-military).


##### Notes:
1. You can only get current time once.
2. You must display hours, minutes, seconds, and AM/PM.
3. Try not to use external resources, but if you must, you can only use MDN and React docs.
4. Style it as best as you can within the allotted time.
5. You have 40 minutes to complete this (please set a timer).
6. Bonus: Add an alarm


##### For the interviewer:
1. dateObj.getHours() returns the hour from 0 to 23.
2. Interviewee should pad numbers with zeroes (ie. 02:45:06, not 2:45:6)
Example:
```javascript
// call this pad function in render()
pad(num) {
  if (num < 10) {
    return "0" + num;
  }
  return num;
}
```
3. Interviewees should volunteer to test that their code is working. If not, prompt them to do so.
  * For example, if they write an incrementSeconds() function that is checking whether or not the current seconds is < 60, then they should come up with an example case where the time is 2:05:59, and test that their code is working the way it should be.
4. **Please grade and leave comments on their scorecard as they go. Pay close attention to how clearly they are explaining their code.**

[**Solution**](https://github.com/joshling1919/digital-clock-solution)
