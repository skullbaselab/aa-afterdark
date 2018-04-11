# Code Intensive

The point of this project is to impress a technical screener/interviewer. The first portion involves completing a project from the curriculum, and the second portion involves showing a proof of concept for that project. Be certain you can speak about what the project entails and why you implemented it the way you did. This could very well come up in an interview!

## Phase 0

Pick from one of the following in-class projects:

1. [Ruby ORM][ar-lite]
2. [Ruby Controller + Views Framework][rails-lite]
3. [JavaScript DOM Manipulation Library][jquery-lite]
4. [Chess][chess]

**If you're interested in doing something else, see your Circle TA to discuss.**

Today we'll be focusing on the low hanging fruit. You're a much better developer now than when
you wrote these programs in class. It's fine to think about longer term goals for this project,
but for today we'll focus on getting this project ready for review tomorrow morning.

## Phase 1: Housekeeping

### Naming

Give your project a unique name. Don't use "lite" or the name of the real library it's based on.
Some ideas from past cohorts:

#### Ruby ORM
* Datafy
* RubyRM
* DynamicArchive

#### Ruby Controller + View Framework
* laris (get it?)
* mu
* puffs

#### JS DOM Manipulation Library
* DOMinion
* dollaBill

### App Academy Skeleton Code

Remove anything that indicates this was an in-class project. Remove any of our comments from the code.
If there are seed files, sample databases, tests etc. you must customize or remove them.

Remove any artificial "phase" designations. Files should contain a single class and use the snake_case
version of the class name.

Also remove any files or code that isn't a part of the project (any warmup projects you included, e.g.
the `attr_accessor_object` from the Ruby ORM or the index.html from jQuery-Lite).

### Repo cleanliness

1. Re-attribute all commits in your own name. Follow [this guide][fixing-git-authorship]
2. Remove any `console.log`, `debugger`/`byebug` and `print`/`puts` statements. Global find is useful here.
3. Remove any `.DS_Store` and `.byebug_history` files and add them to your `.gitignore`.

## Phase 2: Refactor

Be objective. 50 line methods are going to look sloppy and inexperienced to a hiring manager. Scour your code
for all the following common mistakes.

### Long methods

Methods over 10 lines need to be broken up into helpers. Whenever possible, these helpers should
be private.

### Naming

Is it immediately obvious what a variable contains and what a method does? If not, choose a clearer
name.

### Side Effects Vs. Return Values

Does your method have a side-effect or return a value? It should only do one or the other. If a method
is doing both it should be broken up.

### Law of Demeter

Do you have code that looks like this? `board[0][0].moves` What's wrong with this? Well the user of our
`Board` class needs to know something about how the `Board` internally keeps track of its squares (2D array).
We're also assuming that bracketing into the `Board` is going to produce a `Piece` class with a `#moves` method.

Instead we should be doing this: `board.moves(pos)`. Now we don't need to know how `Board` is storing its
grid or what methods are available on `Piece`. We just tell the `Board` to figure out what moves are available
at a position and let it keep the details to itself.

A class should only talk to its immediate neighbor and in turn expose the smallest possible public interface.

### Instance Variables

If you're writing Ruby, instance variables should be used extremely sparingly. Always use reader and writer methods
whenever possible. A good rule of thumb is to assign values to Instance Variables in `#initialize` and use the
reader or writer everywhere else.

## Phase 3: README

Review the [README guidelines][readme-guidelines].

You'll want to include an overview of the project as well as code examples illustrating its use. Imagine you're a stranger arriving at this repo, what do they need to know to use your project in their own codebase?

Include documentation for the public API. A good place
to start is the real documentation for the library yours is based on. Check out the
[ActiveRecord README][active-record-readme] as a starting point.

## Phase 4: Review

**N.B. Address these so your career coach can give substantive personal feedback instead of rehashing project guidelines**

- [ ] Repo has a quality Production README with code snippets, instructions, and a public API.
- [ ] All references to a/A project have been removed. No phases or unnecessary files/ specs you didn't write.
- [ ] Code is refactored and representative of your best effort. Code style is consistent.
- [ ] All commented out code, console.logs and debuggers have been removed.
- [ ] Repo is free of .byebug_history, .DS_Store, node_modules, etc.
- [ ] All commits have been attributed to you as the author. Commits represent proper Git workflow (use rebase -i if necessary).
- [ ] No references to the real-world inspiration => "jQuery lite", "Rails lite", "like jQuery without the bloat!"


## Phase 5: Live Demo

Build a project using your library! This is an essential part of the Code Intensive because it differentiates **YOUR** jQuery-Lite | Rails Lite | etc. from your cohortmates. The underlying code will be similar, but the way you choose to demonstrate the functionality should be related to your passions and personality.

* Ruby Framework: Allow a user to spin up a server and check out your views.
* Chess: Build an AI player, or more obscure moves (en passant).
* DOM Manipulation: Allow users to interact with a simple TODO app, [api], or Snake.
* Ruby ORM: Have a simple database that you can query in Pry.
 
[api]: https://github.com/toddmotto/public-apis
[fixing-git-authorship]: https://github.com/appacademy/curriculum/blob/master/ruby/readings/git-fix-authorship.md
[readme-guidelines]: https://github.com/appacademy/ny-portfolio-curriculum/blob/master/online-presentation/example-readmes.md
[active-record-readme]: https://github.com/rails/rails/blob/master/activerecord/README.rdoc
[chess]: https://github.com/appacademy/curriculum/tree/master/ruby/projects/chess
[ar-lite]: https://github.com/appacademy/curriculum/tree/master/sql/projects/active_record_lite
[rails-lite]: https://github.com/appacademy/curriculum/tree/master/rails/projects/rails_lite
[jquery-lite]: https://github.com/appacademy/curriculum/tree/master/javascript/projects/jquery_lite

