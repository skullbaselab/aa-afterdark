# Pascal's Triangle Demo

Here's how I structure it:
  * Show students slide with picture of Pascal's triangle.  Explain to concept to make sure everyone understands
  * Talk about why this is a good candidate for recursion (by definition has a base case and an inductive step)
  * Goal: write a function, `pascal_row(row)` that will return a row of Pascal's Triangle as an array
  * Whiteboard:
    * Ask the audience for base case(s)
    * Make the inductive step.
      * I like to walk through the example with the case where `row == 2`.  It helps to remove the "magic" aspect of recursion, because we know for a fact what `pascals_triangle(1)` returns.  I make comments along the right-hand side with the value of every variable at each step.
    * Initialize the return array with `1`
    * Ask the class how to build up the new row.  Discuss how recursion and iteration are not mutually exclusive, can be used to together.
    * Shovel in `1` and we're done!
    * Pause to make sure students understand everything we've done, take any questions
  * Computer:
    * Switch to computer where I have a file with the code skeleton
    * Write the code based on what we've discussed, without memoiztion.
      See this [code](pascals_triangle.rb) to see what this should look like
    * Run the file for the first 6 rows. Everything works!
    * Change 6 to 100. It should hang on row 9 or 10
    * Discuss why with the students - maybe ask how to fix it
    * Impliment memoization
    * Now it should calculate the first 100 rows instantly
    * You could draw the execution tree, talk about linear vs exponential number of function calls
