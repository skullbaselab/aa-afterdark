# Updating Lecture Notes


1. Checkout a new branch
2. Push that branch
3. Create a pull request and tag the lead lecturer in it (Aaron)
4. If you need to access the content online, do it from your branch. If
  it's something that the students _really_ need to see on `master`,
  then merge it with an explanation. Still add the lead lecturer as a
  reviewer.

Thanks!

## Directory Structure

The notes for each lecture can be found in their corresponding
directories. As you go through and add notes for new lectures, make
sure to structure their corresponding folders as such.

```
WXDX/
├── deprecated/
│   └── all the old stuff!
├── assets/
│   └── any needed assets, like images, etc.
├── video_lectures/
│   ├── README.md (notes on contents of video)
│   └── demos/ (demos from video lectures go here)
|       └── demo_name/
|           ├── skeleton/
|           └── solution/
├── demos/ (demos from Q&As go here)
|    └── demo_name/
|        ├── skeleton/
|        └── solution/
├── notes.md (this is a file of detailed notes on the readings)  
├── log.md (this file contains q/a from previous cycles
├── lecture_prep.md
└── README.md (this is a static file that shows the agenda for the day)
```

## Example Q&A README.md

This file should show the agenda for the day's Q&A session or lecture.
It should be written in Markdown so that it can be easily pasted into
our [Slides app][slides-app] for presentation.

Here is an example README based on our [standard Q&A format][standard-qa-format]:

```markdown
# W1D2
---

## Agenda
    * Common Mistakes (5 min)
    * Questions from yesterday's assignment (15 min)
    * Today's learning goals (5 min)
    * Quiz Solution (5 min)
    * Questions from the homework (10 min)
    * Today's Material (20 min)
---

## Today's Learning Priorities (5 min)
    * Refactoring
    * Array and hash defaults
    * Scope
    * References

---

## Quiz Solution (5 min)
    * [solutions](https://github.com/appacademy/daily-quiz/blob/master/ruby/w1d2.md)

---

## Mini Demo: Array and Hash Defaults

`Array.new(3, [])` vs. `Array.new(3) { [] }`

```


[slides-app]: https://s-pangburn.github.io/slides/
[standard-qa-format]: https://github.com/appacademy/sf-lecture-notes/tree/master/ruby/w1d4

## Example Q&A log.md

Each time you present a lecture, consult the log for the history of all
previous lectures. The log should be in the following format:

```markdown

# W1D2

## 5/10/2016

Lecturer: AJ Ansel
Scribe: Aaron

### Questions

* How do you write the `[]` syntactic sugar method?
  * This is the correct answer
* What does the `*` operator do in Ruby when passing in arguments?
  * This is the correct answer
* Why do we need to call `[]=` on the `Board` class instead of `Board.grid`?
  * This is the correct answer

```

## Lecturer Feedback

For recording and giving lecturer feedback, refer to the lead lecturer
notes [here][lead].

[lead]: https://github.com/appacademy/instructors/blob/master/lecturing/lead_lecturer_notes.md

