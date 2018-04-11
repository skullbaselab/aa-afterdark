## Solutions prep

[Feb cohort:  Fred](./previous_lectures/febraury2016.md)  
[June cohort:  Leen](./previous_lectures/june2016.rb)
[Aug cohort:  Daniel](./previous_lectures/august2016.rb)

**Expect questions on:**
+ make_change
  + Some people are concerned that using `#drop` will prevent you from making change with two of the same coin. But `drop(0)` won't drop anything.
+ bsearch
  + Need for ternary on right but not left side of bsearch
  + Remind students to assume the previous call was successful when they determine the inductive step.

**Point out:**
+ Compare/contrast merge sort and  quicksort
  + Ask for class input
  + Both split, sort, and put back together
  + quicksort sorts WHILE splitting -- puts two pieces together
  + merge sort splits in half -- sorts while merging together.
+ Debugging demo
  + Pick your favorite problem, break it, and debug it!
  + Make sure people now step, continue, and next, and display
  + People might ask about other commands, like break, conditional debugger, etc.
  + Really nicely broken merge sort written by a student
    ```ruby
    class Array
    def merge_sort(&prc) # Procifies the block
      return self if arr.count <= 1

      middle = self.length / 2
      left = self[0...middle]
      right = self[middle..-1]

      sorted_left = merge_sort(left)
      sorted_right = merge_sort(right)
      merge(sorted_left, sorted_right, prc)
    end

    private
    def self.merge(left, right, prc)
      result = []
      until left.empty? || right.empty?
        if prc.call(left[0], right[0]) <= 0
          result += left.shift
        else
          result += right.shift
        end
      end

      result + left + right
    end
  end
  ```

## Lecture

**1) Git basics**
+ Explain purpose of working directory (all the files you see in atom), staging area, and git directory.
+ Draw on board
  + `git add` puts in staging directory
  + `git commit` puts in git directory
  + `git status` shows summary. Untracked files, files with unstaged changes (red), files with staged changes (green)
  + `git diff` shows unstaged changes (difference between working directory and staged/committed work)
  + `git diff --staged` shows staged changes (difference between staging area and committed work)


**2) Git demo**
+ Make a git repo out of the solutions to the notes.
  + `git init`
  + `git config`
  + Commit recursion solutions and solution notes separately. Check `git status` a lot.
  + Show `git log` at the end (also `--oneline`)


**3) Serialization and branches**
+ Make a `git branch` for these notes and `checkout` that branch
+ JSON - language of the web. A type of string that can be parsed into any language, including Ruby.
  + Demo serialization and parsing of Ruby/JSON
+ YAML - better for Ruby instances.
  + JSON a dog. YAML a dog.
+ Commit notes to new branch!
+ `git checkout master`. `git log`. `git merge <branch>`
+ `git log` again!

**4) Remotes**
+ A remote repository is a version of your project hosted on the internet
+ Create git repo for notes on github.
+ `git remote add origin <remote-address>`
  + This can be confusing. Important to be specific in wording -- a 'remote' is a remote repository. `git remote add` adds the address for a remote repository to your project. Only for this project, not for all projects on your computer.
  + Emphasize that `origin` is a conventional name, not a keyword
  + Show `git remote -v`
+ `git push -u origin master`
  + Show `git status` now has a message comparing your local code to the remote repository. This is thanks to the `-u`, which sets your branch to 'track' the remote branch.
+ `git push -u origin --all`
  + Push all branches!
  + They need this for screwdoku today.
+ Show `git clone`
+ Final note: Warn them not to nest git repositories. This can get ugly.
