Previous Lecture Notes

0. Prep
  0. Print this out
  1. Set up projector, put code on it.
  2. Make sure students have paper and pen/pencil. (Give them 3 mins to grab).
  3. Put on Mic

0.25 Cover solutions from day before

0.5 I will say to GOOGLE it a lot or deflect questions.
  a. This is NOT because I think your question is stupid.
  b. Two reasons: save time during lecture and teach you how to fish.
  c. Feel free to google a couple of these with your partner
  d. This is normal!

1. Goals
  1. To learn why we need RSpec.
  2. To handle common questions about RSpec.

2. Why do we even need testing?
  1. 3 Main reasons
  2. Reason 1: So that we know it works (CAR example)
    a. Draw car on board
    b. If I'm Ford, I want to make sure my car works when it gets to the dealer
    c. As a whole: draw black box
    d. Same way you kept running chess.rb to see if your new methods worked.
  3. Reason 2: You know that it still works if you make changes
    a. If I make changes to the car: I add a stereo, headlights.
    b. Or I'm on pimp my ride: satellite TV, yellow shag carpet and solar panels, hot tub and skylight
    c. Ride pimped out? Xzibit needs to know about RSpec
    d. The car still gotta work
  4. Reason 3: We quickly know which component failed.
    a. Break car down into wheels, steering wheel, ignition, etc.
    b. If the car doesn't turn on, there are too many parts
    c. Quickly identify it was the engine (or something)
  5. With respect to code:
    a. If I'm building a website, which you guys will be doing very soon...
    b. I should quickly test that it works
    c. I can feel free to make changes
    d. If I screw up, I can catch those changes quickly
  1. Tell the story of bob, put tree_written_august_2013 on the board.
      1. Left first, then Bob comes back to his code a year later, forgets that he wrote it, and in a tree_written_october_2015 writes ...(split into left and right on the projector).
  2. Put garden.rb up on the projector.
  3. What's the problem?  Think and write down for yourself (1 min).
  4. Ask the class (1 min)
  5. Enter RSPEC

3. Init RSPEC project live.
  1. Make sure they see the terminal command (`rspec --init`).
  2. Show the folder structure.
  3. Create a sample spec for a car.  Use eq("driving"), not be("driving").
  4. Move on, they'll figure out the rest during the project.

4. Repetitive Definitions Exercise
  1. Show problem code (repetitive_definition_example_spec.rb)
  2. Think: what can be improved here?
    1. What's repetitive?
  3. How do we fix? (Have people write down the code they think would fix.  Give them 3 minutes)
  4. Show solution code (repetitive_definition_example_solved_spec.rb)
    1. Take 1 minute and compare to your own code.

5. Subject vs. let (and before)
  2. Think: what can be improved here?
    1. What's repetitive?
  3. How do we fix? (Have people write down the code they think would fix.  1 minute).
  4. Walk through it with let first, then subject.
  5. Show solution code (example_solved_with_let_spec.rb)
    1. Take 1 minute and compare to your own code.
    2. We need let because we've already defined a subject.
    3. Let is for other variables that we need.  Not for the main instance of the class that we're testing.

  5. We can still improve
    1. Give class 30s, what is still repetitive?
    2. Answer: we still call set_pieces every time
    3. Write out the solution with the class.
  6. Questions

6. Stubs and Mocks
  1. Stubs
    1. Show stubs/lib/customer_notifier.rb
    2. Show stubs/stub_example_spec.rb
    3. Run through a couple examples in pry.
    4. Ask Audience: Take 30 seconds to think to yourself: what could go wrong here?
    5. Fetchnotes actually sent out a test email like this (actually swearing at his users)
      1. http://thenextweb.com/insider/2012/02/06/how-fetchnotes-discovered-that-cussing-at-its-users-was-good-for-business/
      2. What if we could test the notifier without ACTUALLY sending someone an email?
    6. Show solution
      1. Give 1 min to compare silently
    7. Define: A stub "fakes" having a method.
    8. Also a good example of testing each part discretely.

  2. Mocks
    1. What if we could take what stubs do for methods and do them for objects?
    2. Show mocks_and_stubs/mock_example_spec.rb
    3. Ask Audience: Take a minute to think to yourself: what could go wrong here?  What takes a while to code up?
      1.  Answer: Setting up everything we're passing in.  Even though we pass in a BoardDisplayer to the new Board, do we even use it in the test?
      2.  We shouldn't have to configure it.
      3.  Another problem: pretend everyone on the team is writing code at the same time.  And some classes (say, Piece and BoardDisplayer) aren't even written yet.  How can you test your class in isolation?
      4.  We don't care what color the piece is, just that we're setting something on the board.
    4. How would you improve the code?  Spend 10 seconds and think.
    5. Show solution
    6. Like passing in a Hash, with some added benefits.
      (can check for instance variables).
      a. You don't have to worry about the double having ANY methods, while a hash has .each, which could be confusing.
    7. Define: A mock "fakes" having an object.

7. Break for 5 mins

8. "should" into "english with verb"
  1. Show common mistake (1 min) bad_english_example_spec.rb
  2. Get answer from class
  3. Show solution: bad_english_example_solved_spec.rb

9. Intro to test first development.
  1. Tests before code.
  2. An example is an assessment.
  3. Give an example: String#reverse

10. DIY:
  1. Make sure you cover EDGE CASES when you write test cases
  2.  Write the sample spec for Array.pop on paper.  DO NOT write the method. (3 minutes)
    1. Think big and small, negative
    2. Make the array big and small
    3.  Make the argument to "pop" big and small
    4. Try throwing in nils, different data types
  3. Play music
  4. Have people yell out answers for things they tested
  5. Compare to partner

11. How many tests should I write?
  1. In theory, cover everything.  Big companies do this a lot more.
  2. In practice, writing one test gives you 80% of the benefit.  Startups that want to move quickly write fewer tests.
  3. Ask class: When would you NOT want to write tests?
    1. Example answer: When something big broke on the site and you need to push code quickly.

12. Resources:
  1. Where does my knowledge come from?
    1. Book
    2. Live on the job
    3. Don't read the book yet, do it after you start a job.

13. Testing in life
  1. Hot water goes out--how do you test it?  How should the parts work?
    a. Helps you narrow down where the problem is.
  2. Ever have a rubric for an essay or speech?  That's a unit test for a speech.
  3. If you're holding hands with someone, that squeeze is a test that they're still there with you.
  4. Driving test is a series of unit tests: can you turn right at the right time, stop at stop sign, tune out the commercials that go "you've got a friend in the diamond business" , etc.

14. Questions
