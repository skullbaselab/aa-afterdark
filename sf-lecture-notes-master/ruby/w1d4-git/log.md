# 2/15/17

Lecturer: Aaron Wayne
Scribe: Anastassia Bobokalonova

### Lecture Questions

* git add -A does everything? In your computer? While . is in the directory?
  * The .git folder is in the current working directory.
* Does git add . create a new git folder?
* You're in a folder, and you make a new folder, you have to git init again?
* Can you separate the commits from a single changed file?
  * (Googles it), It turns out you can, yes.
* Do you need the -m for a message?
  * Otherwise, vim will open. :q to exit vim.
* When you git initialized, it was in an empty folder. If you did that in a folder that already had stuff in it?
* Is there a way to know when you've passed the 72 character line break.
  * You can set the default text editor to Atom.
* Is there a way to correct commit messages?
* Can you commit the staged changes without committing the unstaged?
* When you delete a file, do you need to change that as well?
* When you delete a file, you can use git remove?
* git reset vs. git reset HARD?
* you can git reset --hard with the hash value.
* What is the difference between clone and pull?
* Does git pull search all of the remote repos?
* When you pull what happens to your local files?


# 12/07/17

Lecturer: Isak Mladenoff
Scribe: Anastassia Bobokalonova

Scribe Notes:
* Great addition of slides about dress codes and waste.
* Multiple examples, on whiteboard, atom, and git, were excellent.
* Impromptu collaboration on doggo-loggo repository was good for demonstrating git pull and commit histories.

### Lecture Questions

* What's the difference between `git add -A` and `git add .`?
  * Explains about being in the root directory vs sub directory.
    * Could you diagram it?
      * Yes.
* Should you also git init in the sub directory?
  * You can but will explain later why you don't want to.
* I read that you shouldn't use `git add .` because it doesn't track some kind of files?
* How is commit different than push?
  * We'll get to it, it's really different.
* If we initialize in the wrong folder, can we delete the .git file?
  * Yes, you can, but it is a directory. So you can't do `rm .git`, you have to do `rm -rf .git`. The r is "recursive" and the "force" is push.
* On my computer, when I do `ls`, I don't see the .git folder.
  * I'll slack something out. In your aliases, you can alias `ls` to `ls -A` to see the dotfiles.
* If you've already initialized a repository and you do it again by accident?
* What does `ls` do?
  * `ls` is not a git command, it's a shell command that lists all the current files and directories in your current folder.
* What did `code .` do?
  * It's like `atom .`.
* What?
  * If you get stuck in vim, hit escape 3 times, :q "enter."
* What does the `-m` do?
  * It says you'll add a commit message at the end.
* You said no punctuation?
  * No trailing punctuation. You can also add emojis, but don't do this.
  * Scribe clarification: you can use exclamation marks, but you have to use single quotes instead of double.
* So you shouldn't have a commit message of multiple messages?
  * A commit message should be an atomic change...
* What about length?
  * 50 characters.
* Note: Explains difference between `git reset`, `git reset filename`, and `git reset --hard`.
* Question about multiple remotes.
* Does the master in `git push origin master` refer to the working directory master or the remote master?
  * It pushes the current branch to the origin's master branch.
* What does the `-u` do?
  * We'll see in a moment.
* Could you add remotes that are local? Like a server in my office?
  * You could, but that wouldn't be local.
* How do you remove set upstream branch?
  * Can google it. Typically you wouldn't remove it but move it.
* What constitutes a merge conflict?
* You typically use branching with collaborators?
  * You can also do it for your own projects.



## 10/05/17

Lecturer: Isak Mladenoff
Scribe: Kelly Chung

### Lecture Questions

1. Can you run `git init` before there are any files?
  + You can. You can immediately initialize a git repo in any directory.
1. If you need a really long message - can you just not add the `-m` flag?
  + Yep - you'll most often just need that flag though, otherwise the
  message will be too descriptive / long
1. `git add -A` adds everything in the directory?
  + Yes. It also starts to track any untracked files in the working
  directory
1. Staging Area and Index are the same thing?
  + Yes
1. Working Directory + Repo are considered two different things?
  + Yes.
1. `git add .`?
  + It is the same thing as `git add -A` as of Git2.0
1. If .git was the repo itself - is that the result `git init`?
  + Yes
1. Did I say `git add -A` no longer does all?
  + They both do all as of Git 2.0
1. If you accidentally initialize a git repo?
  + You can `rm -rf .git`
1. What's the difference between reset + checkout?
  + One un-staged files and the other switch between files
1. Is the difference between a soft + hard reset just the removal of files?
  + Pretty much
1. What is the `.` and `..`?
  + Aliases for the current + parent directory respectively
1. `-u` is short for `--set-upstream`?
  + Yes it is
1. When you `git push -u` - it sets the default branch that you will
push and pull from?
  + Yes
1. Can you add another remote repository and push there?
  + Yes - you would need to push to both remotes separately, but yes.
1. Do you always push to `master` branch?
  + No
1. Is the reason the `.zip` doesn't have the most recent commit?
  + We'll talk about it after class
1. Difference between `git pull` + `git fetch`?
  + It fetches and merges
1. Is it the commits that are chronological - or the merges?
  + It's the commits
1. Will merging a branch delete that branch?
  + Nope
1. What's `gco`?
  + Asher's alias for `git checkout`

# W1D4

## 7/03/17

Lecturer: Kelly
Scribe: Isak

### Questions

#### Git
  * Is `...(master)$` only in bash?
    * The "current branch" thing is from your a/A dotfiles.
  * If we create new files in the directory and say `git add .` would it move them all to the staging area?
    * Yes.
  * If I make two different changes in the same file and realize one should be committed but one shouldn't is there an easy way to commit part of it.
    * "I(, Kelly,) have never been so particular about commits. If I needed to do this I'd probably just `cut`, `save`, `commit`, `paste`. (But will follow up on if there is line-by-line committing)
  * (Follow up to the above) When developing, should you not be trying to do two things at once anyway?
    * Yes, but it doesn't always work like that in real life and so it's worth looking into the line number `git add` anyway.
  * Will git pull pull all branches or the current branch?
    * (will be addressed in the next part of the lecture)
  * I pushed my repo to GitHub, is this now a remote repo?
    * Your repo is on your computer so it is still local.
      * Maybe we could make clear that there is a 'copy'?
  * Can I not enter my username/password every time I push?
    * Check out SSH tutorial on GitHub, linked from our curriculum
  * Does the remote repository have the same commit history?
    * Absolutely, anyone who collaborates on a repo will have their own identical copy of the history.

### Code demo

#### Aliases
  * Why is `irb` set to `pry`?
    * I will never allow myself to use pry. (Nor anyone using my machine)
  * The root directory is...

#### Git

    * The thing that pops up at first in bash. Contains your macOS 'my docs' folder.
  * What do the colors mean?
    * ...
  * If you have multiple repos can you have the same remote.
    * ?
  * Can you create a remote repo from the CLI?
    * No... but honestly there's _probably_ a way to do so.
  * Can you not call multiple remotes `origin` in different repos?
    * No, each different repo can have remotes with the same name as those in another repo.
  * Can you change origin?
    * Yes you can change it to a different remote on GitHub or delete it altogether.
  * Once you merge the commits will be reflected in the history of the master branch?
    * Yes

#### 10x Engineer

### Follow up
  * Slack out more information on `git add -am` (didn't quite catch `git commit -am`?)
  * See if you can commit just certain lines of a file in the same way you can just commit single files instead of always `git add -A`
  * How to graph git
  * Slack out SO dev survey

## 6/01/17

Lecturer: Kelly
Scribe: Dallas

*Rearranged to have content first and questions last to accommodate time constraint*

### Git
  * What is the difference between `--set-upstream` and `-u?`
    * Nothing. Just a shortcut.
  * What do they do?
    * They allow you to not have to manually type `git push [remote] [source]`
  * Once you do `--set-upstream` once is it set forever?
    * More or less, yes. Unless you alter it somehow.
  * Everything is local *until* you push to a remote?
    * Yes. Remotes include GitHub, BitBucket, and several others
  * What is the command to unstage a change?
    * `git rm [file path]`
  * Does that mean that the file will stay the same locally and just not be committed?
    * Yes. And the changes will not be tracked locally or reflected in the remote.
  * `git reset` vs `git reset --hard`
    * `git reset` untracks all files. `git reset --hard` will revert to the last commit
      losing all of the local changes. `git reset` without the `--hard` will not change
      files.
  * If you git reset into a previous head, does that change to a new branch?
    * No. But it does allow you to time-travel and create new commits from that earlier
      state.
  * Is there a limit to how many commits you can make on your local repository?
    * The limit is the memory on your computer.
  * What is the .git file?
    * An amalgamation of all of the changes to each file, along with the time and message
      of each commit.
  * Is there anything you can't put into the message?
    * You have to escape quotes. Emojis are bad practice.

### Code Demo

#### Aliases
  * Does `alias sl="ls"` map twice if `alias ls="ls -a"` is also defined?
    * No. Only maps once.
  * Use David Dobrynin's git re-assignment shortcut to fix git authorship.

#### Git
  * Can you move files using the command-line?
    * Yes. `mv`
  * If you have `--set-upstream` can you push automatically to multiple repos?
    * No. Just one.
  * If I ran `ber` from the aliases, can I add other commands on the end?
    * Yes, but aliases only work when at the beginning of the command.
  * How do we install?
    * Copy and past into `.aliases` in root.
  * Can there be more than one alias files?
    * Yes, but they won't be called `.alias`. You have to be careful because there is a
      priority in which these files are loaded.
  * If you use `git checkout -B`, does it overwite the existing branch?
    * Yes.
  * Is `git checkout -b` a hybrid command?
    * Yes. It creates a branch and checks it out.
  * Can you have multiple branches form the same locaiton?
    * You can not only have multiple brances, but you can branch off branches.
  * What is the difference between branches and forks?
    * Forking is copying an entire repository and making it yours. Any changes will only
      be relevant to you and not the original project.
  * If there is a commit after your branch, can't you just git-pull to get the changes?
    * Yes, but you will run into conflicts if you are working on the same files.
  * When do you create a branch?
    * Any time you are doing team work, you will want to work off branches, so that the
      master has a controlled change history using pulls.
  * How could I branch out from an earlier commit?
    * `git checkout [head]`, the `git checkout -b` from there.
    * `git checkout` almost always creates a branch or 'virtual branch'
  * What happens to the branch when you use `git branch -d`?
    * It deletes the branch from your local, but that change is not reflected in your
      remote until you push. You may have to manually delete in other areas, and the
      deletion will not show in your git history.

#### 10x Engineer
  * How do you locate good companies and communities?
    * Check public reports for disparities and D&I efforts


## 3/30/17

Lecturer: Gage Newman
Scribe: Kelly Chung

### Non-lecture Questions
  * Can you clarify how bsearch works?
  * How does the base case in bsearch work? What do we return?
  * What would happen if you didn't do nil check in bsearch?
  * How does the last line of subsets work?
  * What's the difference between shovel and concat?
  * What's the difference between += and concat.
  + `git checkout master` isn't working - what could be the reasons for that?
  + I entered a weird text editor on my terminal (VIM), what do I do?
  + What does fast-forward mean?

### Lecture Questions
  * Does git automatically make an initial commit?
  * When you clone master and someone else pushes to master does your computer
  update?
  * Should we only commit once we have something working?
  * Do we need to commit something to test that it runs properly?
  + If there are multiple files in the staging area, will they all commit?
  + How does each git repo know what their origin is?
  + What is the `master` in `git push -u origin master`: local or remote?
  + Can there be git repositories within repositories?
  + We clone git repos to work on it locally and then push the chances back to
  the remote repo?
  + Can multiple people work on one repo at a time?
  + When do changes get reflected on all the local versions everyone has?
  + What if two people are working on things simultaneously? How do
  differences get resolved?
  + What happens to local files when you do a git pull?
  + Is it best practice to have your .gitignore file first before
  adding files to be ignored?
  + Since Git isn't the same is GitHub, would the commands for Git work
  for a repo that isn't GitHub?

### Notes
  + Talked about the `10X Engineer` - wooooo!
    + https://www.quora.com/topic/10X-Engineers

## 1/26/17

Lecturer: Shamayel

**Yesterday**

**Recursion**

+ what is tail recursion? # let's look it up -> don't worry about it too much

+ could you talk through the permutations solution? # walk through solution,
explaining how to think about creating permutations
  + what about this other way to think about it? # that's fine too
  + isn't the comment wrong in this solution, shift vs. pop? # yeah, but it
  doesn't matter too much
  + if we mutate the array here, does it change it in the other scope? # yes
  + couldn't we use array.first and pass in array.drop(1) or something
  to the recursive call? # yeah, if you didn't want to change the array that
  could work
  + `take` vs. `slice`? # either way is fine
  + why is it `perm.length` and not `perm.length - 1`? # we want to insert a `3`
  at the end as well
  + ?? # this ends up being an empty array, not `nil`
  + ?? # sounds like it would work
  + is it better to recurse or iterate? # it depends on what you want out of
  the problem
    + in terms of complexity? # again, it depends - you can write them either
    way
    + ?? # correct, you could probably write a recursive helper function to
    replace the inner part, but it would probably be really hard
  + ?? # the first time, `perm` represents an array from the previous recursive
  step

**Word Chains**

+ why do we store the words as k-v pairs? # we want to find the shortest path;
we need a way to trace back
+ how can we do `last`? # it will implicitly call `self.last`, so it will work
  + stylistically, is it good or bad? # sometimes being explicit is preferred;
  ruby likes handling things like that for us
+ long single-line methods or multiple short lines in a method? # if you're one
character over 72 characters, that's not terrible
+ what about short variable names? # `el` means element, `i` and `j` mean
index; those are conventions in programming now
+ is map a bad thing to do? # no, `beware` it because it's so legit
+ ternary shorthand for returning `true` or `false`? # ??
  + returns and ternaries in general? # explain ternaries
  + can you put two different method calls in a ternary? # yes, but it's not
  good style
  + if you want to shovel the output, you put it in parentheses? # yes

**Quiz**

+ Q2 - you'd have to add the branch name? # yes
+ Q2 - `co` isn't a command? # no, it can be an alias, though

+ Q3 - ?? # `git reset --hard` removes unsaved changes
+ Q3 - but the question says saved changes? # you might need to add the commit
hash
+ Q3 - or `git reset --hard HEAD`? # yeah
+ Q3 - why do this rather than take an old version? # good question
+ Q3 - ?? # `git reset #{commit hash}`
+ Q3 - staged changes? # yeah
+ Q3 - ?? # you can go back as far in time as you want; `git reset --hard` by itself will only go back to `HEAD`

+ Q4 - what does the `-u` do? # sets the upstream; let's look it up -> the
remote that this local repo is connected to
  + so we only do it once? # yep, first push and then you're set
  + if you do `push -f`, will it only change that branch? # yes, it'll only
  change the branch that you're pushing to

+ if you branch off a branch, will new files be in the branch above it? # draws
git branch diagram on board and explains
  + if we go back and make a file, will it show up in the child branch? # no
  + if you merge branches back in to master? # explains using branch diagram
    + so is it better to merge branches before merging into master? # the
    problem is the merge conflict, not where it occurs
  + if you change one file but add all the files to your staging area, will it
  mess up everyone else's work? # you can't add files that you haven't changed
  + if you... ?? # in general, stay up to date with a feature branch until it's
  ready to merge to master
  + is there a way to get the command line to show a visual of your git
  branches? # `git log` is the closest you can get on the command line
  + ?? # you only get a merge conflict when two people have changed the exact
  same file; this is generally only a problem if you're working with a team
  + what if you have a folder called `projects` ... and someone else accesses
  your GitHub and pushes to it? # it should be password-protected, so noone
  else can push to your GitHub or change your files
    + is pushing to GitHub via HTTPS the default? # yes
  + ?? # if the remote has changed, you can run `git pull --rebase` and it will
  stack your new commits on top of the old commits from your remote
  + what about using third-party visualization tools? # go for it; I don't use
  it, but you can
  + `git log --graph`? # sure, a nice example of googling something
  + my `homeworks` repo is now gross - how do I get rid of it? # you can delete
  the whole repo and it'll be gone permanently
  + `git add -A` vs. `git add .`? # anyone know the answer to this?
    + `-A` will reflect all changes, `.` won't? # yep, `.` will only reflect
    changes to files that already existed
  + do branches persist after you've merged them? # they can, but I recommend
  deleting them

**Homework**

**Git**

+ does `git` stand for anything? # don't know
+ are there files that exist that can't be added? # `.gitignore` has a list of
file that will never be added to staging
+ "add" vs. "adds" in commit messages? # "add"
+ always start with a capital letter? # company style should determine your
choices
+ does it automatically link to your remote? # no, we have to set that up
+ does git automatically make the `.git` directory? # yes
+ ?? # correct, you can't clone the curriculum because you don't have the
access privileges
+ ?? # you would have to pull regularly to fetch any changes that have happened
since you cloned
+ does the `origin` name apply to just this repo, or everywhere on my computer?
 + # just this repo
+ ?? # if you set one to upstream, that's what you'll be pushing to
+ privacy question - is this stuff public? # yes
  + can I make it private? # yes, if you pay for it
    + I really don't want people to see it # it'll be fine
+ can I make `git push` push to multiple remotes? # no
+ if there's ever anything upstream that's not in you local, you'll get an
error? # yep
+ if I had my own README and it was different from that README, I would use `git pull --rebase`? # yep
+ if we have one homeworks repo, are we doing a new `git init` every day? # git
init -> new repo; git clone -> change existing repo
+ can you organize repos under a parent super-repo on GitHub? # no; you'd
structure your files inside repos because repos are top-level constructs on
GitHub
+ ?? # `git reset` will unstage files
+ can you make aliases in terminal? # not sure; I prefer creating them in
`bash_profile`
+ what about the crazy lines at the top of your `bash_profile`? # don't worry
about it
+ can you git init in a folder with a repo in it already? # no
+ ?? # remotes are still there
+ ?? # don't worry about it too much now
+ ?? # absolutely
+ is there any protective measure to keep people from messing up master? # not
really
+ ?? # some terminals show you the branch that you're on; you can set it up; it
might be part of the new dotfiles
+ how would I push my new branch from the terminal to the repo? # we'll see
very soon!
+ ?? # let's look it up -> `pull` is `fetch` + `merge`
+ iTerm vs. terminal? # different settings; I heard to use iTerm from my friend
+ ?? # I pulled at the beginning to make sure that my branch had the most
up-to-date information
  + if you're working with someone else, shouldn't you `pull` and the `push`? #
  yeah, but I know nobody else has changed the curriculum since I pulled
+ is there a defined workflow? can you merge this PR? # I can
  + can you set up a stricter workflow on GitHub? # yes
+ ?? question/comment about webhooks # you can use git and github in many
different ways
+ should we be doing versioning on any of our projects? # not a bad idea for
larger projects (FSP or job search projects but not necessary for daily
projects)

Notes:

remember to repeat or rephrase each question

re: `git add -A` vs. `git add .` - not sure if your answer was right. I think git
2.x "fixed" `.`so it now tracks all changes and the main difference is where
git looks for changes (`.` -> local file and subfiles, `-A` -> all files in the
repo). maybe worth checking with Claire?
http://stackoverflow.com/questions/572549/difference-between-git-add-a-and-git-add

re: meaning of git -> `git` is a rude word in british english; linus torvalds
once joked that he names all of his creations after himself (Linux, and then
git).

lots of theoretical questions - maybe some of these questions are addressable
via demos?

the messing with the curriculum demo went over very well :)

---

## 11/17/2016

Lecturer: Gage Newman

### Homework / Quiz Questions

0. Is deep dup a super comprehensive duplication?
  - No - it pretty much only accounts for Arrays (as far as data structures go)
0. Make Change
  - **Reviewed solution**
0. What does drop(0) and take(0) do?
  - drop(0) does nothing, but take(0): idk. (it takes nothing as well)
0. Where does 'last' get set?
  - self.last, because Array#last
0. Word Chains
  - **Reviewed solution**

### Lecture Questions

0. If you use something other than git, do you still use git?
  - Nope, you use a different CLI entirely.
0. Are there ways to connect one remote repository to another?
  - Yeah. We recommend local repository as the home base
  for all of your code changes.
0. Is there a difference between branching and forking?
  - Forking => you don't own it, you copy it. Branching => you have access.
  Fork big open source projects, but branch things you have a direct influence
  on.
0. What does Git mean in terms of intellectual property?
  - Outside of scope, but interesting! We won't get into that right now.
0. Do companies primarily use Github?
  - Yes
0. Copyrighting?
  - Let's save that for later. lol
0. Can you use Git for any kind of file?
  - Yes - you can use it for all kinds of different files.
0. If we want to push to two separate remotes, do you need two staging areas?
  - You will push the same set of commits to both (or more), so no.
0. What if two people are working on separate computers on the same files,
commit them and push them to the shared remote?
  - It depends, honestly. If they directly conflict, they would present a
  merge conflict. If not, those changes would be merged together.
0. Would you catch it if you pulled before you pushed?
  - You totally would. **ALWAYS GIT PULL BEFORE WORKING.**
0. What is a pull request?
  - We'll get into that in the demo.
0. When you commit, you're basically taking a snapshot of all the changes? And
  if you don't push those, that snapshot stays on your local machine?
  - Yes
0. What does it mean to jump to a previous snapshot?
  - Look at reading provided for last night.
0. As far as Git having a huge log of all your changes, at what point does it
stop keeping track of really old changes?
  - Changes are still there. FOREVER
0. Are all of these commits things that are totally done, or potentially in
progress?
  - Sort of in between - work in bite-size pieces.
0. Can you make multiple branches off of a branch?
  - Yes, but we won't go too far into that.
0. After merge - if you continue working on branch, but want new changes on master,
do you have to merge again?
  - Yes. Prune branches after merging it completely though.
0. Does merging automatically remove branch?
  - Depends - Github just implemented feature to merge and close pull request.
0. How would you manage access for branches?
  - Not something we're getting into.
0. If you have a lot of people working on a branch, is it kind of a race to see
who commits first?
  - Yes - first or last most advantageous lol.
0. Can you merge a branch of a branch into master?
  - Yes
0. Should you capitalize your commit messages?
  - It depends. **DEPENDS ON COMPANY / TEAM**
0. Can you add empty folders to git keep?
  - Add git keep for empty folders.
0. Repo name the same name as directory?
  - Typically - yes.
0. Is there a reason to change alias to something other than origin?
  - Yes. It will get confusing if you're pushing to a single remote from
  multiple local repos all named origin.
0. Do you have to keep setting up a remote repo every time you reboot terminal?
  - Nope. Saved in your local repository.
0. How does Github handle nested repositories?
  - Just don't do it.
0. Would you recommend having a repository for homework and projects?
  - Why not just make a new repo for each project? They're free - why not?
0. Do you have to git init something you git clone?
  - Git comes set up when you git clone.
0. What would happen if you tried creating a repo with a name that's used?
  - Error message.
0. Would you want to use git push -u if you are working with a partner?
  - Probably not. Just push once to your own repository, don't duplicate project
  in two different remote repos.
0. Can we check whether or not we're up to date with git remote repos?
  - You can, sometimes. In certain circumstances, it doesn't provide accurate
  information.
0. Does it matter how many repositories you have for job search?
  - Honestly not really.
0. Can you reset a reset?
  - If you foresee resetting a reset, you can go down an alternative route.
0. Why pull request instead of push request?
  - Master branch pulls changes inwards, not branching pushing things
0. How do you go back in time?
  - Find previous commit and jump back to that.

### Mistakes

* Array#take will return an empty array if it takes in 0.
* NY banned git add -A?

### Notes

* People started asking a lot of questions before getting to the meat of the
lecture. Would just tell them to hold off unless they're curious about something
specific to what you're talking about.
* New a/A student Git Workflow (commit and push everyday!)
  - Homework Folder
* Apparently git add -A is the default in Git 2.0? So git add <path> == git add -A <path>
* NUKED APP ACADEMY CURRICULUM. GAGE, HOW COULD YOU?! :fire: :scream:
* Perhaps, we should actually create a new branch, nuke it, and revert it just
so people have a better understanding the different ways to revert to an older
version.

### Personal Notes

* Fundamentals of Git
* Adding Committing Branching
* 'Understand Git Workflow'
* What is Git? Why use it?
* Git = version control system
* allows for easy collaboration and distributed development
2/3 use Git as version control system
- subversion (2nd most common)
- team foundation server (Microsoft)
- Mercurial
* Git was created by Linus Torvalds in 2005 for Linix kernal
* **Git is not Github**
* Asher's visual representation of local / remote repository*
* Workspace vs Staging
  * Workspace (red)
  * Changes to file appear here.
  * Staging (green)
  * Intentional move from workspace to staging (removed from workspace)
  * Commit
  * Intention move from staging to commit (removed from staging)
*vertical version of Asher's branching diagram*
* How does Git work?
  - Does not store entire project in each commit
  - Each commit is a snapshot of the project at that moment
  - If you clone or download a repo, you get the full commit history
* What makes a good commit message ?
  - present tense
  - short yet descriptive (good and bad example)
  - commit well, commit often
*Github Demo as a/A Student*
  * git init
  * git status (doesn't care about empty folders - they don't exist)
  * git keep / git ignore
  * git add -A vs. git add . (latter will only add folders already included in remote)
  * git log (commit hash, author, date, commit message)
  * git remote add <local> <remote-url>
  * git remote -v
  * git push -u <local> master
  * git clone <remote-url>
  * .gitignore
  * git reset --hard
*Github Demo as Developer*
  * NUKED APP ACADEMY CURRICULUM. GAGE, HOW COULD YOU?! :fire: :scream:

## 9/15/2016

Lecturer: Claire Rogers

### Questions
* How does lookup in a set work?  Why is it more efficient than an array?
* How do make change and word chains work?
* Difference between `-A` and `-u`?
* What is the difference between the index and the staging area?
* Difference between tracked and untracked files?
* How do you get a single file from a previous commit into a later one?
* Why do we use branches?
* How I know what branch to push to?
* Does pushing only push the last commit, or all commits?
* What does `-u` do when pushing to a remote?
* Do you need `git init` after cloning a repo?

### Mistakes
* Not commiting staged files before switching branches.  Students were confused why the files followed them between branches. (from the magic rabbit part of the hw)
* Students were very confused about forking
* Not understanding the difference between local and remote repositories

### Notes
* I got a lot of 'what if' questions about all the possible things one could do with git/github.  I should have shut these questions down sooner.  My recommendation to future lecturers is to have a very clear outline of what commands you want to cover, and stick to only those.  I think my lecture was very helpful for the strongest students, but left a lot of the weaker students in the dust.  Next time, I would make sure to focus on only the basics.  Go over the diagram, make sure they understand staging area, repositories, and remotes.  
* I did two demos:
  * How to git like an a/A student
    * make hw folder
    * `git init`
    * add folders
    * `git add -A` - nothing tracked!
    * add .gitkeep
    * create github remote
    * push
    * move to another folder, clone
    * git log to show that commit history is present
    * make changes & commit & push
    * talk about creating multiple remotes
    * open original folder and pull
    * add top secret folder
      * add it to .gitignore
  * Github like a pro
    * go to curriculum
    * `git pull`
    * branch off
    * delete a folder
    * hack repo root readme
    * add, commit, and push
    * show how to use branches on github
    * make pull request


## 7/14/2016

Lecturer: Asher

### Questions

  * What does HEAD refer to?
    - The commit you're currently looking at
  * Can you branch off a non-master branch?
    - Yes
    - Imagine two teams working off master, one person might branch off of their team's branch.
  * Use git with HTTP vs SSH?
    - HTTP: username and pw
    - SSH: username and pw automatically stored in a file so you don't have to type
  * How often should you commit? How detailed should commit messages be?
    - Commit for every little feature you build, ideally. 1-4 sentences is good.
  * Why start at the user-facing part when debugging?
    - How else do you know there's a bug?
  * How do you strike a balance between learning curriculum vs productivity?
    - Look into productivity when you're repeating yourself a lot.
​
### Mistakes
​
  * Reset vs revert vs checking out
    - Reset unstages
    - Reset --hard deletes back the branch
    - Revert makes a NEW commit
    - Checking out moves the HEAD back but keeps the branch as it was.
  * Difference between next, step, continue in byebug
    - Next: next line in current function
    - Step: dives into next function
    - Continue: go to next byebug
​
### Notes
  * Make announcement the day before about needing to bring in laptops
  * Terminal window should be sized to just the top half of the screen
  * Announce putting laptops away before demo/further lecture -- a few students in the back were just messing around on their laptops
