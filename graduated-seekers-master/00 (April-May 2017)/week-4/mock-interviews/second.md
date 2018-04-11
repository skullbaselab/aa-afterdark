# Partner B interviews Partner A

## Confronting Question (1-2 minutes)
Tell me what sets you apart from other boot camp grads?

## Parsing and Populating (40 minutes)
Please download the [parser.zip file][parser-zip].

You are provided a CSV file from TechCrunch that contains funding data for a large number of American companies.

Your task is to populate a database with only entries of **unique**, **web** companies at their **most recent** round of funding. If there is more than one round of funding on the same date, choose the higher amount.

You must create a script for populating the database with only the right entries; don't just throw all the data into the DB.

There are no specs; you are responsible for verifying the progress of your work. Don't worry about writing tests, just make sure you have a good way of tracking how you are doing.

Your final deliverable should be a DB with 756 entries.

Bonus: Which Company's most recent funding round was highest relative to the average of its state?

### Parsing and Populating Solution

Here's the [solution file][parser-solution] for reference
([alternate version][parser-solution2] using 'date' library)


Things to watch for:
* Not including the first row as an entry (because it is the headers)
* How does the applicant get started/explore the shape of the data?
* How is the applicant approaching the issue of duplicates?
  * How did they find all the duplicates?
  * Finding a way to handle each subset of duplicates
  * Dealing with string formatted dates
  * How to make years since '00 evaluate to greater than the '90s
  * How to compare months
  * Dealing with 1 or 2 digit days
* How is the applicant checking their progress?
  * Print statements
  * Errors
  * Final count
* How is the applicant handling the errors in the DB population?
  * nil entries
  * stray single quotes
  * String vs. Integer types on insertion


* Bonus answer: [["Kayak", 172331666.66666666]]

AVG(RaisedAmt)  |  State   |    max(RaisedAmt) | Company  |   diff            
---------------- | ---------- | -------------- | ---------- | ----------------
23668333.3333333 | CT         | 196000000      | Kayak      | 172331666.666667


<!-- Links -->
[parser-zip]: ./parser.zip?raw=true
[parser-solution]: https://github.com/amaciver/parser-project/blob/master/solution/parser_solution.rb
[parser-solution2]: https://github.com/amaciver/parser-project/blob/master/solution/parser_solution2.rb
