# Full Stack Project & Proposal

Note:
Check all policies around full stacks to make sure nothing has changed before
giving this lecture

---

## Full-Stack Project

+ The first time (but not last) we ask you to design an app from scratch
  + This is an opportunity to fill in the gaps in your knowledge: become more
independent
+ This is a lot more work than implementing a design we give you, so get ahead
early!

---

## Project Advisor (PA)

Note:
Your instructors are going to take much more of a back seat role during the
full stacks.
We are here to offer you advice when you ask, assist with bugs, and help you
stay on schedule.
Your goal and our goal is to become a fully independent developer, because
your instructors will sadly not be following you to interviews or job.

---

### What To Expect

+ Checkpoints: PA will schedule to exclusively meet with their mentees on
W8D2, W8D5, and W9D1
  + PA's will monitor progress through GitHub issue completion every day
+ All PA's will be available answering questions from all pods
+ Your PA will be strict and push you to further your own abilities
  + You and your PA will agree to a specific set of MVP features to complete
  + Any incomplete feature will result in a job search strike

Note:
Answering questions will not be the first priority for PAs. We will be
monitoring and giving feedback to our mentees first, then answering general
floor questions.

---

### You are a Software Developer

+ From this point forward, the curriculum has taught you everything you need
to know to build a Fullstack web application and, more importantly, **how to
learn**
+ Software developers are always referencing SO or the official documentation
  + Make that your first line of defense
+ Y'all will become familiar with techniques and tech that others don't - ask
each other for help
+ Just like the Blue Bird, you can fly: the remainder of this curriculum is
structured to make sure you soar

---

![corgi-fly](https://media.giphy.com/media/8E1uPDT9gfhJK/giphy.gif)

---

## Frontend vs Backend

---
## Backend

* This is happens on your server
* Business logic: **relationships, filtering, sorting & ordering**
  * Rails/ActiveRecord/Postgres are _very_ good at this
  * Don't do heavy processing on the front-end
   + Protect your store from holding unnecessary information

---
## Frontend

* This is happens in your user's browser.
* Display logic: **Formatting json/model data** so the user can **view**
and **interact** with it
  * Rails is _okay_ at this
  * React/Redux is _exceptionally awesome_ at this
* Don't use jQuery to manipulate the DOM
* Don't use CSS frameworks, like Bootstrap

---

## How Do We Go About Planning & Building This

#### Be _User First_

Note:
As developers, we are building for our user.
What will they do on our site?
What will they see?

From there, we will spec our site from the front end to the back end.
This way, we can resolve all the dependencies for the functionality that we
want.

---

1. Make **wireframes**

2. The **components** need to segment the data being displayed

3.The **store** needs to hold the information presented in the components

4. The **API Endpoints** need to give the correct information to the store

5. The **schema** needs to hold the relational information provided by the API
endpoints

Note:
Once we have done that, we build it back to front.
We do this so we can test our code every step of the way.

At a job, you might be given a mockup by a designer and they will say, "i want
these things to move these ways" and your job is to build it.
They have designed the mockup around the user and it is what you will work
from to design the app.

---

## Requirements

+ MVP List
+ Design Docs
  + Wireframes
  + Component Hierarchy
  + Sample State
  + API Endpoints
  + DB Schema
+ GitHub Milestones / Issues

[Sample Proposal](https://github.com/appacademy/bluebird/wiki)

---

## MVP (Minimum Viable Product)

+ The MVPs of your project should be a full-stack app
  + Hosting on Heroku
  + User Authentication
  + Production README
  + 4 others from the MVP list

[MVP List](https://github.com/appacademy/curriculum/blob/master/full-stack-project/readings/mvp-list.md)

---

## Wireframes

+ Have detailed wireframes for every page the user can visit

+  This is probably the most important part of the proposal
  + and will save you the most time

+  You will refer to your wireframes constantly throughout the project


---

## Component Hierarchy

+ Your frontend application's overall component structure
  + How are they nested?

+ Annotate every React component and child component(s)

+ Determine relevant information for each component
  + Does this component need a container? What will be in the props?
  + Does the component need a local state? What will be stored there?
  + What router path will render this component?

---

## Sample State

+ Draft your state shape
+ What information do your components need?
+ How can it be organized to ease access and reduce duplication?
  + Save yourself now, don't nest resources inside of each other

Poor state design takes a long time to fix later

---

## API Endpoints

+ How will your state be filled with the information your components need?
+ How can the user change your data?

---

## DB Schema

+ What tables and relations will your database hold?
+ Note database-level validations and foreign key relationships.

---

Think about Project Design while working on BenchBnB!

---

## GitHub Issues and Schedule

+ The order you plan on implementing your features - with detailed sub-points!
+ Include expected time to implement. Be generous with the time estimates!
  + 2 days for major features
  + 1 day for minor features
+ Include bonus (stretch) features that you will implement given enough time

---

### Tips for the FSP

+ At every stage of your project you have a working app. It might not be a
"good" app, but it should function.
+ Iterate quickly
  + build small pieces to completion
  + test often: write a method, test a method
+ Complete one feature at a time: Write the full stack for each part of your
app before moving on to the next piece.
+ DON'T write a complete rails app first and then add React on top.

---

### Plagiarism

We at App Academy take plagiarism very seriously. There's a huge
difference from referencing and learning from the projects of your
predecessors, and just blatantly not writing files of code.
Don't make the mistake - any infraction of this policy will result in
immediate dismissal.

---

### Trust me, everything's going to be fine

---

![corgi-1](http://buzzsharer.com/wp-content/uploads/2016/04/funny-corgi-meme-snow-face.jpg)

---

![corgi-2](http://buzzsharer.com/wp-content/uploads/2016/04/corgi-error-system-frozen-meme.jpeg)

---

![corgi-3](http://weknowmemes.com/wp-content/uploads/2013/01/are-you-mocking-me-corgi.jpg)

---

![corgi-4](http://s2.quickmeme.com/img/95/95d4e360db4adb7170e599b9983c205f48e86bf33289b37eb98a46df2d8d5fe9.jpg)

---

### Seriously though, we got your back

---

### Finishing Thoughts

---

### Walkthrough

[here](https://github.com/appacademy/curriculum/tree/master/full-stack-project/proposal)

---
