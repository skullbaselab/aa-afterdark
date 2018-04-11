# Assessment Prep

## Practice Assessments

* [A01](#assessment-1)
* [A02](#assessment-2)
* [A03](#assessment-3)
* [A04](#assessment-4)
* [A05](#assessment-5)
* [A06](#assessment-6)
* [A07](#assessment-7-nyc-only) (NYC only)


**Windows users, please use one of our workstations for the
assessment.**

At App Academy, your progress will be measured by periodic
assessments. The assessments are designed to test the level of
understanding of the current material, and to ensure that you are on
track to enter the workplace at the end of the class. **If you fail
any two assessments (retakes included) you will be asked to leave the
course**.

Assessments provide you with feedback about your progress, and give
you an early indicator if you are falling behind. To get an accurate
reading, it is important that you study hard and push yourself during
the test.

**Pro-tip**: `ctrl-l` will clear the console's output, so
scrolling to the top of RSpec specs becomes faster.


## Lather, Rinse, Repeat!

Here's a general guide on how you might prepare for an assessment:

1. Run the specs for the practice assessment; make sure they run.
2. Start a timer.
3. Write solutions to the specs (in order if possible) until they are
   all passing.
4. Stop timer and evaluate your time.
5. Open and look at the solutions.
6. Close the solutions.
7. Take a break so you don't just memorize the practice
   problems. Study up on concepts that were hard. Repeat the practice.

It really helps to focus on hitting on one spec at a time. Try not to
think ahead too much. It's easy to get stuck trying to tackle all
seven specs for some method; instead you should run the tests
frequently focus only on hitting the first failing spec. Warning:
don't take this as dogma, sometimes you may have to hit specs out of
order, skip sections of the spec, or find it faster to pass multiple
specs at a time.

## Colorizing RSpec Output

You can create a `~/.rspec` file to turn colored output on by
default. Put these lines in it:

```
--color
--format documentation
```

A lot of the demos (and the assessments) should already have a
`.rspec` file already in the assessment directory, but this will apply
globally for whenever you run rspec.

## Assessment 1
### W2D1

Assessment 1 will test general programming knowledge.

#### How to prepare

The following is a (non-exhaustive) list of topics that may be covered:

* Searches and Sorts
* Recursion
* Enumerables
* Arrays, Strings, Hashes
* Monkey patching

**Pro-tip**: read the description of the failing spec, look at the
spec code, and read the error message.

### Resources
* [A01 Practice][a1] - [(zip)][a1-zip] - Released on: W1D4

## Assessment 2
### W3D1

**Note**: Assessment 2 will not test your knowledge of RSpec. It is useful to
know RSpec because that will make it easier to understand why a spec is
failing, but you will not be required to write any RSpec tests. The spec files
may use doubles and mocks, so make sure you can understand RSpec's usage of
them.

#### How to prepare

This assessment is somewhat more complex than the
last and has specs broken out across files. The recommended approach is
to run each spec individually. This will give you more manageable
output. Read the instructions. The instructions will contain a
suggested order in which specs should be run.

The following is a (non-exhaustive) list of topics that may be covered:

You should know how to:
+ Create classes
  + Create class and instance methods that allow objects to interact
  + Create a class inheritance structure
+ Raise errors when appropriate

In the practice assessment, we build a Blackjack game. You may review the basic
rules of Blackjack on [Wikipedia][wiki-blackjack]. The game for the actual
assessment will be announced W2D5.

[wiki-blackjack]: http://en.wikipedia.org/wiki/Blackjack

### Resources

* [A02 Practice][a2] - [(zip)][a2-zip] - **In class practice** - Released on: W2D4


## Assessment 3
### W4D1

Assessment 3 consists of two parts: **SQL** and **ActiveRecord
Associations**.

For the SQL part: this will work exactly like SQLZoo.

The ActiveRecord part of the assessment consists of a Rails
application with models and a schema. Consulting the schema, you will
write the associations that interrelate the various model classes.

#### How to prepare

+ Review SQL Zoo
+ Do the practice assessment
+ Review associations in project solutions up to this point
  + Start with `has_many` and `belongs_to` associations before moving on to any
  `has_many_through` associations

### Resources
* [A03 Practice][a3] - [(zip)][a3-zip] - Released on: W3D3 6PM
* [SQLZoo Project](https://github.com/appacademy/curriculum/tree/master/sql/projects/sqlzoo)
* :video_camera: [Assessment Seminar Video](https://vimeo.com/176868244) (go_video_go)

## Assessment 4
### W5D3

#### How to prepare

Know Auth!!!

The following is a (non-exhaustive) list of topics that may be covered:

+ Authentication
+ Basic CRUD (Create, Read, Update, Delete) operations in ruby on rails.
+ Lather, rinse, repeat the practice assessment and learn how to read the [Capybara][capybara] specs.

There are two practice assessments below. The first, A04 Practice, is the
main practice assessment. Focus on this one to start. Treat it as you would
any other practice assessment. The second, A04 Buggy, is a solved version
of that same practice assessment, but with a solution full of bugs. The
goal of this buggy assessment is for you to become familiar with the wide range of
bugs you might see in the course of the real assessment. There's no need to
time yourself on this one or even to work through it all the way. It's there
as extra practice. Feel free to compare with the regular A04 Practice solution
if you get stuck.

**Resources**:
* [A04 Practice][a4] - [(zip)][a4-zip] - Released on: W4D4
* [A04 Buggy][a4-buggy] - [(zip)][a4-buggy-zip]
* :video_camera: [Assessment Seminar Video](https://vimeo.com/229053924) (go_video_go)

[capybara]: https://github.com/jnicklas/capybara

## Assessment 5
### W6D4

#### How to prepare

The following is a (non-exhaustive) list of topics that may be covered:

+ Sort and Search
+ Enumerable Functions
+ Easy - Medium Recursive Problems
+ JS-specific concepts from W5D3-W5D5

**Resources**:

* [A05 Practice][a5] - [(zip)][a5-zip] - **In class practice** - Released on: W6D1
* Practice running [jasmine][jasmine-github] specs
   * ([Additional tutorial][jasmine-tutorial]).


[jasmine-tutorial]: http://evanhahn.com/how-do-i-jasmine/
[jasmine-github]: https://github.com/jasmine/jasmine

## Assessment 6
### W8D2

#### How to prepare

Know the Redux cycle!!!

The following is a (non-exhaustive) list of topics that may be covered:

+ Action Creators
+ API Utils
+ Reducers
+ React Components (container, presentational, and functional components)
  + Index pages
  + Show pages
  + Forms
  + Basic Navigation

You will not need to:
+ Create the `frontend` file structure from scratch
+ Write `thunk` middleware from scratch
+ Write frontend routes in the `Root` component
+ Style your components
+ Write any backend code

* [A06 Practice][a6] - [(zip)][a6-zip] Released on: W7D4


## Assessment 7 (NYC Only)
### W9D1

**How to prepare**: Take the practice assessment and redo the [W6D2 CSS Day](https://github.com/appacademy/curriculum/tree/master/html-css/projects/css_friends) CSS Friends project.

**Resources**:

* [A07 Practice][a7] - [(zip)][a7-zip] - Released on: W8D2
* [CSS demos and videos](https://github.com/appacademy/css-demos/)
* [HTML-CSS Curriculum](https://github.com/appacademy/curriculum/tree/master/html-css)

[a1]: https://github.com/appacademy/a01-prep
[a1-zip]: https://github.com/appacademy/a01-prep/archive/master.zip
[a2]: https://github.com/appacademy/a02-prep
[a2-zip]: https://github.com/appacademy/a02-prep/archive/master.zip
[a3]: https://github.com/appacademy/a03-prep
[a3-zip]: https://github.com/appacademy/a03-prep/archive/master.zip
[sql-zoo]: http://sqlzoo.net/wiki/Main_Page
[a4]: https://github.com/appacademy/a04-prep
[a4-zip]: https://github.com/appacademy/a04-prep/archive/master.zip
[a4-buggy]: https://github.com/appacademy/a04-prep/tree/master/debug_version
[a4-buggy-zip]: https://github.com/appacademy/a04-prep/blob/master/debug_version/skeleton.zip
[a5]: https://github.com/appacademy/a05-prep
[a5-zip]: https://github.com/appacademy/a05-prep/archive/master.zip
[a6]: https://github.com/appacademy/a06-prep
[a6-zip]: https://github.com/appacademy/a06-prep/archive/master.zip
[a7]: https://github.com/appacademy/a07-prep
[a7-zip]: https://github.com/appacademy/a07-prep/archive/master.zip
