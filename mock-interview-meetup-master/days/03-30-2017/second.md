#### Build something problem
Using React, build a game of tic-tac-toe. Does not need an AI, just build it to allow two human players to alternate going.


##### Notes:
1. Try not to use external resources, but if you must, you can only use MDN and React docs.
2. Style it as best as you can within the allotted time.
3. You have 40 minutes to complete this (please set a timer).
4. If Xs win, render a message that says "Xs win!", and vice versa, along with a button that says "Restart Game". Restart the game when "Restart Game" is clicked.
Bonus: Add an AI


##### For the interviewer:
1. Interviewees should volunteer to test that their code is working. If not, prompt them to do so.
  * For example, if they write a checkForWinner() function, they come up with multiple test cases (especially potential edge cases) and test their code without being prompted.
2. **Please grade and leave comments on their scorecard as they go. Pay close attention to how clearly they are explaining their code.**
3. Potential way to use css to set up a tic tac toe board:
```css
.board {
  display: flex;
  flex-wrap: wrap;
}

.cell {
  border: 1px solid black;
  height: 100px;
  width: 33%;
}
```
