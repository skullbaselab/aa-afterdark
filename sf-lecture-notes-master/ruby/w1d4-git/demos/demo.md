# Git Demos

## Local repos and commits

Create a repo

```bash
mkdir my_shapes
cd my_shapes
git init
```

Show that a `.git` directory was added.
Point out git PS1

See the current status

```bash
git status
```

Make a file and show status

```bash
touch circle.rb
git status
```

Make a `Circle` class with a `color`.
We like that work so let's commit.

```bash
git add circle.rb
git status
```

Talk about commit messages:

+ Start with a verb
+ Imperative mood
+ Please no emojis

```bash
git commit -m "Add circle functionality"
git status
git log
```

Now let's do some refactoring.

```bash
touch shape.rb
touch square.rb
git status
```

Refactor the three files for inheritance.

Now `circle` has been changed and the other two are untracked still:

```bash
git status
git add shape.rb
git status
```

We can also bulk add:

```bash
git add . # adds everything inside our current directory
git status
git commit -m "Refactor Shape from Circle and add Square class

This is the body. We want to describe what and why, not how. Totally
optional. The Square and Circle had similar functionality so they now
share a parent Shape class"

git status
git log
```

## Resetting Demo

Add x,y to shape, radius to circle, length to square.

```bash
git add .
```

Oh no! We didn't want to commit our changes to shape yet.

```bash
git status
git reset shape.rb
git status
```

Now shape won't be staged for commit.

We could commit here, but let's play around with reset a bit more.

Let's reset everything from staging

```bash
git reset
git status
```

Now, let's just add shape.

```bash
git add shape.rb
git status
```

Let's say we actually don't want to commit any of these changes.

Be VERY CAREFUL with this command. There is no way to revert back. It's
the `rm` of git.

```bash
git reset --hard
git status
```

Bye forever.

Now some coolness of reset:

```bash
ls
rm *.rb
ls # oh no!
git reset --hard
```

git knows all!

## Remotes Demo

Let's connect to a remote. Set up a repo on GitHub.

```bash
git remote
git remote add origin <url>
git remote
```

We could 

Now we can push our commits to GitHub

```bash
git push -u origin master
```

The `-u` flag sets our default remote push location for the `master`
branch. This would work without it too. Just allows us to say:

```bash
git push
```

Add scribe as a collaborator and let them push a commit.

Note that scribe will have to

```bash
git clone <url>
```

So the repo is on their computer. Then edit, add, commit, and push.

Check GitHub to see the commit.

Now let's get information from our remote

```bash
git fetch
git status
git log
```

We can see that we are now one commit behind our remote. Let's get that
info.

```bash
git pull
git log # should add that commit
```

Done!

## Branching Demo

Checkout a branch from master

```bash
git branch
git checkout -b my-branch
git branch
```

Make some changes to it. Add, commit, git log.

Make some changes to master. Add, commit, git log.

Checkout `my-branch`, make some more changes.

Now we are done with `my-branch` and want to incorporate it into master.

This is where merge comes in. Checkout master. Now we can merge.

```bash
git merge my-branch
git log
```

Now we have merged the info from our branch, we don't need it anymore.
Let's delete it

```bash
git branch
git branch -d my-branch
git branch
git push
```

Done!

