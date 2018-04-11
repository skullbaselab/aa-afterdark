# W1D1

## 02/13/2018

Lecturer: Ned

### Questions

+ Is a string a collection of pointers to each character?
  + No. This is the case for an array. It does store the actual characters.
+ How do you create a deep duplication of a string or array?
  + Shows an example with `dup`. Don't need a deep dup bc string doesn't
contain internal pointers
+ Could you use clone instead of dup to deep dup?
  + Example, it is the same as `dup`
+ Difference between deep and shallow dup?
+ Is this a common issue?
+ Should you always have it on hand?
  + We'll use it to teach references, but it's not super common. There is one
in ActiveSupport when we get to Rails
+ How does Ruby actually copy each value?
  + 
+ How did our shallow dup solve a solution yesterday?
  + You weren't worried about mutating the internal strings
+ Can symbols be duped?
  + Demo, nope
+ Doesn't the array need to be duped if it only holds three pointers?
  + In Ruby, arrays are dynamic arrays. Ruby allocates a set amount of spaces
and will resize it under the hood (longer explanation than that)
+ Is there a way to get the history of a variable?
  + No, it might sometimes be useful for debugging, but no language does this.
+ Why use concat vs `+=`?
  + If you want to reassign the value to a new variable without mutating the
original. `+=` changes the `object_id` and will take longer since it has to
be duped
+ To clarify, concat does mutate?
  + Yes, when an object changes, it has to be done through assignment or
mutation
+ Is `+=` slower than concat?
  + concat is faster, but unless performance matters, use whatever is more
readable
+ Is there a strong reason to start with nils when ruby will prefill spaces
with nils?
  + Ned thinks this is a mistake in the design of the language, it should give
an out of bounds error. Don't use this.
+ Does the `Array.new(0, [])` cause the same problem with fixnum?
  + No, even though each FixNum will point to the same number, there is no
way to mutate that number. The only way to change it is to reassign that index
in the array
+ If you can pass it a block, what is the use of the default value?
  + Useful if the default is immutable
+ What about `y = Array.new(8) { x = [1,2,3]; x }`
  + They are local variables
+ What about assigning `x` outside? `x = [1,2,3]; y = Array.new(8) { x }`

## 12/4/2017

Lecturer: Tommy Duek

### Qs from Tommys's Intro Lecture
+ Is there any time when we are explicitly not allowed to be? 
  + You can work here 24/7 just beware that guards leave at 7pm.
+ Are we reviewing the solutions in pair or alone?
  + It's up to you, you can do it solo or with your pair if you are up to it.
+ After 6pm can I work with anyone aside from my pair.
  + Absolutely after 6PM your are free to do what you want.
+ To what extent do we know about our pair review ratings?
  + You will find out when need-be but they are anonymous.
+ Do we switch every single 15 mins even on long projects?
  + Yes, we switch between 2 roles while pair programming, driver and navigator.
+ Do files persist?
  + Most likely, but you will be assigned different desktops each day.
+ How can we let you know that we will be absent?
  + Via email to _instructors-sf@appacademy.io_, this will be the main media of communication.
+ What happened if you do get dismissed from strikes.
  + You will pay a prorated amount, that will consider how many days you were at aA.
+ Do we know the minimum passing score before the assessment?
  + No you dont, we use a little bit of a curve. You will know the passing score, median and average after it.
+ Is it bad if you dont finish every single project?
  + Not at all, we design the projects for you to learn in depth, not to finish them, you should not expect to finish any of them.


# W1D1

## 5/29/2017

Lecturer: Jeff Fiddler

### Qs from Jeff's Intro Lecture

+ Still can’t get access the curriculum # Will address those issues individually

+ How soon do you have access to the quiz? Can I do it on the way home? # Quizzes 
available after 6pm and refer to that night's homework material.

+ If you did all the prep work on your machine and you didn’t have any problems, 
should you be fine on assessment 00? # Probably

+ Is there any way to get Ruby docs from the terminal during the assessment? # There 
is, but please don’t. It goes against the ethics of our assessment process.

+ What is considered passing? # We set the passing score based on the performance 
of the group and what we’ve determined is necessary to move onto the next stage 
successfully. 

+ Do we know in advance how many you’ll need to pass the assessment? # No

+ Comparing the difficulty of assessments to quizzes and homework, are the 
assessments more difficult? # The pressure is high, encountering a bug during an 
assessment is very stressful, but the material isn't new. We throw new material 
at you every day with the projects and homework and quizzes, but the assessments 
are not new material.

+ Are the practice assessments similar? Can we assume if we do well on the 
practice that we’ll do well on the actual? # Yes to the first, no to the second. 

+ If you’re sick and you miss an assessment, what happens? # Worked out on 
a case by case basis.

+ What about a medical emergency during an assessment? # We'll work it out with you.


## 1/23/2017

Lecturer: Jeff Fiddler

### Qs from Jeff's Intro Lecture

#### Intro part

+ Who are you? # jumping the gun, that comes two slides from now

+ are there TAs / Instructors available after hours? # two or three days a
week, for an hour
+ do we need cash for the key deposit? # yes, once they're available
+ until we get a key/keycard, how do we get in? # come in during normal hours
and there's no problem; otherwise you'll have to talk to the security guard.
  + and how do we get in the office door? # you can request a key to the office
  as soon as you want.

+ ?? # let's talk about that when we get there
+ what should we do if we notice a typo, lie, or deceit? # email
instructors-sf@appacademy.io, create a github issue, or make a pull request
+ how do you download atom? # it's a free text editor; google `download atom
text editor` or something like that

+ do we submit homework? # you'll create a github repo and upload your hw to
that; we'll go over it later
+ if you don't finish the day's projects, how big of a deal is that? # review
the learning goals and use those as the benchmark for what you should get out
of the day
+ ?? # some days there are bonus assignments; building coding fluency and
getting experience is good; if you have time, do the bonus assignments
+ if the work is done on computers here, how do we get it? # tl;dr use github
+ what can we expect as far as the evening workload? # from 1 - 3 hours, so a
lot.

+ do we stick with one pair the whole time? # you rotate through multiple pairs

+ you will paraphrase the feedback we've gotten? # yes, we won't share any
specifics with you
+ working on the day's projects after looking at the solutions:
  + those are the projects we worked on with a pair? # yes
  + wouldn't we already have looked at the solutions? # yes

+ is there any time for us to work with a TA to get our environment set up? #
yes, usually in these first couple weeks TAs will service your machines

+ does everyone get the same assessment? # yes

+ can we share the projects we work on in pair programming? # yes, they will be
on your public github profile
+ will we be allowed internet access during the assessment? # yes, but you can't look anything up on it - you should only use it for installing gems
  + what is the passing grade for assessments? # between 75 and 95, curved.
  + does the internet ban during assessments include ruby documentation? # yes
  + what about rdocs in the terminal? # no way to police that; a grey area; not
going to be helpful after the first assessment
  + what about pry? # pry is strongly recommended
  + ?? # the tests that you have are the tests that we will be testing your code
against
  + will you give us a string when we're expecting a number? # ??; i don't think
we have any tests like that
  + are there prep assessments? # yes, and we have assessment prep seminars the
day before each assessment

+ can we change the configuration of atom (e.g., remove autocompletion)? #
please do not change atom's configs on the school computers.

+ is the driver allowed to question the judgment of the navigator? # of course;
maintain respect for each other and don't be a jerk
+ do the lectures go over the same material as the night's stuff? # yes, but
don't rely on them to entirely cover the material
+ if you're the driver and you disagree with the direction, should you just
bide your time and erase their legacy once you're in charge? # no! you should
have talked out your plans beforehand

+ when you're both working on a problem and you ask a TA and you're still
stuck, should we move on? # you won't get stuck if you as a TA
  + if we get stuck, should we move on? # not really viable after the first day
  or two

catchall questions:
+ do we use slack while we're pairing? # yeah, i would recommend having slack
open all day - on your workstation machines. do not have your phone / laptop
out during the day
+ how do we ask a TA for help? # progress tracker!
+ how many languages does app academy focus on? # ruby, JS, SQL, CSS, HTML,
english
+ can we bring snacks? # yes, unless they're gross
  + to the workstation? # yes
+ can we use notes while pairing? # yes, paper notes
+ what if we get sick? # stay home and recover. email us. get better.
+ are days counted fractionally (if we miss them)? # yes; that will be covered
by the code of conduct lecture
+ what accounts will I need to log in to on the school machines? # github
+ is there any way to expunge a strike? # no. you get 10.
+ can we listen to music during assessments? # yes, with headphones
+ will we know if we get a strike? # yes

#### Code of Coduct part

+ so if we do need to miss a day or a roll call, what do we do? # email
instructors-sf@appacademy.io

+ what are some examples of harassment? # we'll get to that - thanks!

#### Assessment demo part

+ what does the `it` part mean? # it's the syntax for the rspec DSL
+ have you already run `bundle install` yet? # not yet
  + is there ever a time when `bundle install` could give bad results? # no

### Notes on Jeff's Day 1 lecture

#### Intro part

**should people have laptops open?** # answered at 9:20am
depth of learning > progress in the day's project/s
  *typo* on this slide (`all the matters` -> `all that matters`)


## 11/14/2016

Lecturer: Jeff Fiddler

### Questions
* Can I access my bike at any time?
* Can I leave without a key after 7?
* Do we do the readings/etc listed under today's date or tomorrow's?
* What should we focus time on if things are taking longer than expected?
* How do we know how well we do on assessments?
* Are the assessments open book?
* Can we use pry during assessments?
* How are the assessments scored?
* When in the day do we take assessments?
* Can we take assessments on our personal machines?
* Do we interact with people outside our pods?
* How are pods chosen?
* What's the retention rate?
* Are we going to keep using Piazza?
* Questions about strikes from missing days
* Are quizzes graded?
* Are homeworks graded?
* Why use `bundle exec rspec`?
* Do we need to `bundle install` every time?
* Does your code on assessments have to be efficient?
* How many failing specs means we fail the assessment?
* Will everything on the assessment be covered in lecture?


### Mistakes
+ did inject which required way too much explanation, do something
  simpler

## 9/12/2016

Lecturer: Jeff Fiddler

### Questions

#### First day stuff
+ "unfinished assignments" - is that assignments from the past or from the future?
+ does app academy collect any of your projects during the curriculum?
  + are we willing to discuss the projects and the curriculum in the progress report?
+ could we get our homeworks reviewed by an instructor to make sure that we're doing them well?
+ the quizzes aren't collected? how does all that work?
+ what exactly is in the progress report?
+ is it expected that we write test framework code?
+ are built-in snippets that come with the text editor ok?
  + what about 'react-snippets' plugins &c.?
+ what is a failing grade on an assessment?
+ for homeworks, can you work with a pair?
+ is it mandatory to ?? (couldn't hear question) - answer was no, not mandatory

#### Code of conduct
+ how do you handle the possibility of false accusations if the reports are anonymous?
+ question about mediation during complaints (couldn't hear question)

#### Pair programming
+ how do you start working on a project or a part of a project? do we talk about it or does the navigator just start directing the driver?
+ if you can't explain a concept using verbal language, maybe you don't understand it (not really a comment, more a question)
+ is there a gray area around using the timer?
+ if the navigator is stuck and doesn't know how to proceed, should they talk to the driver about it?
+ should the stronger partner in the pair always be the navigator?
+ how do we handle the navigator being stuck if the driver knows what is going on?
+ switch every fifteen minutes vs. take breaks?
+ how detailed should you be in your description of what to do (as the navigator)?
+ are we encouraged to bring ergonomic materials?
+ is there a place to store equipment at App Academy?
+ if we bring a mechanical keyboard, ??
+ is there a policy regarding eating or drinking while pairing?
+ what is the dress code?
+ is it ok to take a break during pairing if you discuss it with your partner?

#### Assessment
+ what is a passing score?
+ will we know the passing score beforehand?
+ is the score based on the class's performance?
+ is there a case where you can pass an assessment without completing one of the problems?
+ if all the specs pass, will I get 100%? (Jeff's question)
+ is there partial credit?
+ can you ask TAs about syntax during an assessment?
+ can you get partial credit?
+ is it ok to use cloud9 during the assessments?
+ can we use pry and irb?
+ is styling important on the assessments?

#### Demo Assessment
+ do the assessment specs test for large numbers to test a solution's time complexity?
+ do we have leeway as to how we write our solutions?
+ can we use gems to solve the assessment problems?
+ how does the timing work for assessments?

#### Alumni Q & A
+ how should we spend our weekends? do we get days off?
+ how do employers recognize your experience at App Academy?
+ how stressful are the assessments?
+ what were your backgrounds before App Academy?
+ what resources do you recommend to learn programming?
+ in your job search, how many of your leads were from App Academy graduates?
+ what companies are you working at?
+ did you work on custom projects or a clone?
+ do employers look at your full stack project?
+ how long did it take you to get a job after App Academy?
+ momentum (getting one offer and then suddenly getting more)?
+ do employers go on vacation at the end of the year?
+ how much did you talk to recruiters?
+ how much do your salaries match App Academy's statistics?
+ can you defer your start date once you get a job?
+ do you disclose your deferral requests after you get the offer or after you sign it?
+ how many people failed out of your cohort?
  + why did those people fail out?
+ is there anything you wish you'd started earlier regarding the job search?
+ what technologies are you using in your job and did you learn them at App Academy?
+ are there resources you recommend to go over interview questions?
+ are there advantages coming from a nontechnical background?
  + did you list your previous experience on your resume?
+ is ruby on the way out?
+ how are salaries / job prospects between "pure" tech companies and, say, GE?
+ what are career tracks for junior developers?
+ what are other benefits that we should look out for beyond salary?
+ what was the hardest part of App Academy?
+ what did you do to succeed other than just show up at App Academy?
+ during the job search, did you keep coming in here or work from home?
+ what tips do you have for studying for assessments?
+ do people from App Academy take non-web development jobs?
+ did your programming blog help you get a job?
+ how helpful did you find App Academy's network?
+ what would you do differently if you did App Academy again?
+ what did you prioritize at home - day's projects vs. readings for next day?

### Mistakes
+ forgot to tell them about slack

### Notes


## 7/11/2016

Lecturer: Jeff Fiddler

### Questions

#### Logistics Questions

* Could you clarify when things are due? Do you do the assignments for W1D3 before class or after class?
* If you clone a repository to your computer will that be up to date?
* Can you bring up bikes?
* Should you continue working with your same pair after class?
* What is the approximate attrition rate?
* How would a laptop be ergonomic?
* Should we wait 5 minutes before asking our partner for help? (No.)
* What happens if there are an odd number of pairs?
* What do I do with my personal property?

#### Coding Questions

* Should we leave comments in our code?
* Can you get partial credit if you come close to passing specs?
* Does the time limit include reading the readme and unzipping the files etc?

### Mistakes

* error in reading about how long to wait before asking for help

### Notes

* make sure to tell them to use slack
