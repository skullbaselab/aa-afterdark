# Git: Part 1

## What is Git?

+ A very popular **Version Control System** (VCS)
+ Why use a VCS?
  - saving project history
  - merging work on a large project
  - storing/serving project code
+ History: [Linus Torvalds][linus-torvalds-jokes]' Linux Kernel team

## How does Git work?

+ commit
+ "ref", "hash", "commit hash"
+ branches
+ remotes
+ [working tree, index (staging), and HEAD][staging-diagram]

## Committing

#### Commands

+ `git status`
+ `git diff`
+ `git add`
+ `git commit`
+ `git log`

#### When do you commit?

+ you're about to change direction (also a great time to branch)
+ you've added a small, atomic feature or change
+ branch is reasonably stable
+ it's been a while since the last commit

In short, whenever you might need to get back to this exact state.

#### Writing a commit message

+ Give a succinct summary in the top line. Try to keep it < 50 chars
+ If more details are needed, include them below after a blank line.
+ Aim to make your commits small and focused enough that you only need
  the top line.

## Branching and Navigating

#### What is a branch?

#### Commands

+ `git branch`
+ `git checkout`
+ `git checkout -b <branch-name>`
+ `git merge`

#### When do you create a branch?

- whenever you need to easily get back to a state
- any time you might need to merge
- you begin a feature
- you want to try an experiment

## Remotes and Github

+ [creating a new Github repo][github-create-repository]
  - **do not** include `README.md` or `.gitignore`
+ `push` (& `remote add`)
+ [Set up SSH][ssh-setup] on your personal computer.

## What you'll do today

Git instructions are embedded in [today's project][minesweeper]. Go do!

## Extra topics (if time)

+ Aliases: `git alias`
+ [rewriting authorship][authorship-script]
+ [adding collaborators][adding-collaborators]
+ `git clone`
+ `git pull`
+ `git checkout <commit> <file>`
+ `git reset` (`--hard`)
+ `^` and `~`
+ `git rm`
+ `git rebase`
+ `git reflog`


[linus-torvalds-jokes]: http://liquidworm.blogspot.com/2008/03/linus-torvalds-jokes.html
[staging-diagram]: http://git-scm.com/book/en/v2/book/01-introduction/images/areas.png
[adding-collaborators]: https://help.github.com/articles/adding-collaborators-to-a-personal-repository/
[ssh-setup]: https://help.github.com/articles/generating-ssh-keys/
[authorship-script]: https://github.com/appacademy/ruby-curriculum/blob/master/w1d5/git-fix-authorship.md
[github-create-repository]: https://help.github.com/articles/creating-a-new-repository/
[minesweeper]: https://github.com/appacademy/ruby-curriculum/blob/master/projects/w1d5-minesweeper.md
