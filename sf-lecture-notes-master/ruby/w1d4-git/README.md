# W1D4

---

Congratulations on persevering through recursion day


![YOU ROCK](https://i.pinimg.com/474x/79/4b/a8/794ba8391e77bed80057fdac0dcbe5af--you-are-awesome-im-awesome.jpg)

---

### Quick Meditation

---

### Agenda

* Today's material
  * Git overview
  * Git demos
    * Repos
    * Remotes
    * Branches
  * Git and this course
  * Git and you!
* Quiz solutions

---

### Lecture Learning Priorities

* Understand the fundamentals of Git
* Gain a perspective on Git in your field and your own work
* Learn how to get credit for your homework

Note:

As mentioned by Tommy yesterday, Git is an extremely important skill in
development. Continue to push your git knowledge throughout the course.

---

### Whyyy Git?

* Versioning
* Collaboration

Note:

Versioning let's us go back to old code. When managed correctly, nothing
we write will lost forever, like the sands of a text editor's `cmd-z`
history.

You read a bit about Agile development in the homework last night. One
of the given terms there was continuous integration. This refers to the
process of making small, incremental, and often changes to a code base.
This means that everyone needs to be working on their own versions of
the code base until their version works. Then, but only then, everyone
else can incorporate that code into theirs as well.

---

## Not Like This

![word-docs](https://github.com/appacademy/sf-lecture-notes/blob/master/ruby/w1d4/assets/word_docs.png)

---

### What is Git?

* Git is a version control system (VCS)
* Allows for easy collaboration and distributed development
* Created by Linus Torvalds in 2005 for the Linux Kernel

Note:

Git was originally developed as a command line tool to create and manage
the development of the Linux Kernel. Now, it is the most widely used
versioning control software.

Others:
Mercurial
Subversion

Git is one of the more complicated version control systems. We will use
it though because it is also the most powerful. A lot of the commands we
learn today are ubiquitous across most VCSs, but as you learn more of
its functionality, it will be a critical part of any project.

---

### How does it work?

* Code is saved in a _commit_
* Does *NOT* store entire project in each commit
* Each commit is a snapshot of the project at that moment
* Cloning or downloading a repository grabs the entire commit history

---

### Local Repo Commands

* `git init`: initiates local Git repository
* `git status`: see current changes from last commit
* `git add <file-name>`: add a single file
  * `git add .`: add all files from working directory (and all child directories) to staging area
* `git commit -m <message>`: moves updates from staging area to `.git`
  * Start with a verb; imperative mood; _no_ emoji
* `git log`: see list of commits

Note:

Stay here for a while. Let them copy things down.

---

## Conceptual Diagram
### Local repos/commits

---

## Code Demo
### Local repos/commits

---

## Don't be that person

![xkcd-commit](https://imgs.xkcd.com/comics/git_commit.png)

---

## Local Reset Commands

* `git reset <filename>`: remove a file from staging area
* `git reset`: unstage everything
* `git reset --hard`: wipe out everything back to your last commit (or a specified commit)

Note:

Stay here a while

---

## Code Demo
### Resetting

Note:

All the git commands we have learned so far have been about progressing
changes towards a commit. Now let's learn how to back off a bit and
move them backwards.

---

### Remote Commands

* `origin`: default remote repo
* `git remote add <url>`: Adds a remote
* `git remote`: List Remotes
* `git push <remote> <branch-name>`: moves updates from `.git` to remote repository
  * `git push -u <remote> <branch-name>`: moves updates from `.git` to remote repository, sets upstream branch
* `git clone <url>`: copies the remote repo to your local machine
* `git fetch`: gets updated info from the remote repo
* `git pull <remote> <branch-name>`: gets updates from remote repository

---

## Conceptual Diagram
### Remotes

Note:

There are many other remote repo hosting sites other than GitHub. Just
like the VCSs themselves, each hosting site has its own set of pros and
cons.

Others:
BitBucket
GitLab
AWS Code-Commit

---

## Code demo
### Remotes

---
### Keep your `options` open

* `--force`/`-f`: force option, be careful
* `--all`: with `push` pushes _all_ branches

`git push --all` 

  * consider using today after Screwedoku

Note:

The goal should be to pretty much never force push. There is usually
another way to do it. Just google and expand your git skills.

---


### Branching Commands

* `master`: default main branch
* `git branch`: lists branches
* `git checkout <branch-name>`: switch to branch
* `git checkout -b <branch-name>`: create and immediately switch to branch
* `git branch -d <branch-name`: deletes branch
* `git merge <branch-name>`: merge <branch-name> into current branch

---

## Conceptual Diagram
### Branching

---

## Code demo
### Branching

---

### Summary

* (Local) repos
  * Committing
  * Resetting
* Remotes
  * Pushing/pulling
* Branches
  * Branching/merging

Note:

We always want to watch what we're adding and committing. This means we
should use `git status` before just about every action we do to our
local repos.

---

### "Good enough"

+ Your future company will teach you their Git workflow
+ You won't be expected to know any more than this
+ Focus on mastering the fundamentals; building on top of those will be easy

Note:

There are many variations of branches that development teams will use.
Just like the VCS and hosting sites, they too have a range of pros and
cons. As you get more comfortable with Git, these will become apparent.

---

### The most important Git command:

`open http://google.com`

Note:

Such a vast amount of git commands, there is always new ones to learn.
And if you want to do something in git, there is probably a command for
it.

---

### Today we end Airdrop

* Learn Git *today*
* Push the days' projects (not a typo)
* This is how you will turn in your homework from now on
  * Homework will not be accepted in any other form

Note:

Git is a worthwhile skill that saves development time with every new
feature you learn.

---

### This is the homework system starting today

* Andres (@andres) manages homework
  * He is your buddy; make his life as easy as possible
* Make a `homework` repo
* For each day make a folder called `WXDY` folder inside this repo and push to your Github
  * The homework you are doing tonight should be in the folder called `W1D5`, the day it is due


---
### No [nested repos!](https://github.com/mladenoff/please_no_nests)

```diff
 └── nest_stuff
     ├── home_for_a_bird
     │   ├── bluejays.rb
-    │   └── .git
     ├── nest_free
     │   ├── bunnies.rb
     │   └── turtles.rb
     └── .git
```

Note:

Nested repos will not push correctly to GitHub. They will be in what is
called a _submodule_. Not really important now, but just don't do it. If
you are including a repo in another repo, remember to delete the `.git`
folder.

---

### gca

* Thanks @dobrynin!
* `gca <your name> <your email address>`
* Rewrites the commits
* This is a time when it is okay to `-f`orce
  * but `git log` and make sure all the commits are there!

---

### One more incentive...

[Green squares == green rectangles](https://github.com/gaearon)

---

### Quiz solutions

* [Quiz Solutions](https://github.com/appacademy/daily-quiz/blob/master/ruby/w1d4.md)

