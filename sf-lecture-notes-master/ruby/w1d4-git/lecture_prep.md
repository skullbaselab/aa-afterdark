# Lecture Prep Doc

## Topics Covered in Readings & Materials

+ 

## Topics covered in Homework

+ 

## Topics Covered in Today's Project

+ 

## Preparing for Lecture

Mostly practice the conceptual diagrams and code demo
a lot.

### Background

+ [Git commit messages](https://chris.beams.io/posts/git-commit/)
+ [Git fetch](https://git-scm.com/docs/git-fetch)
  + Tells us if there is any new information from remote
+ [Git pull](https://git-scm.com/docs/git-pull)
  + Actually incorporates new info from remote into our branches

### Be one with the gitfu

Get a file from another branch

```bash
# On branch other than master
git checkout master -- file.rb
```

From a commit 3 commits ago:

```bash
git checkout HEAD~3 -- file
```

Remove a file from tracking without actually deleting it:

```bash
git rm --cached file.rb
# make sure to add it to .gitignore
```

Go to a previous commit and work from there:

```bash
git checkout <hash>
git branch -b <branch-name>
```

Lose the most recent commit forever

```bash
git reset --hard HEAD~1
```

