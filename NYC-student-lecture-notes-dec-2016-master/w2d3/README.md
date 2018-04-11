# Testing

### Motivation

* Automate the process of verify that the code works
* Make sure we don't introduce bugs as we add complexity
* Document the way the code should behave

If someone is paying you to write code, you MUST test that code. Period.

### RSpec

* RSpec is one of several testing frameworks for Ruby.
* By following a few conventions, it does most of the heavy lifting for you.
* API
  * expect
  * matchers
  * let/subject
  * let!/subject!
  * allow
  * doubles

### Writing Tests

* Unit tests

  * What to test
    * Public methods
    * Mission critical private methods

  * What to skip
    * Testing ruby
    * Behavior of related classes

### TDD

* Done to ensure test coverage of all written code
* Encourage writing code that is easy to test
* Discourage writing unneeded code

* RED
* GREEN
* REFACTOR

https://github.com/rspec/rspec-core
https://github.com/rspec/rspec-expectations
https://github.com/rspec/rspec-mocks
