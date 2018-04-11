
## Testing React/Redux
#### Using Jest & Enzyme

---

## Workshop

- We will write tests for BenchBnB
- Take a moment to download and setup the solution from the Graduate Seekers repo
  - `bundle install`
  - `bundle exec rake db:setup`
  - `npm install`

---

## Testing Tools

- Jest
  - Facebook's JS testing framework
  - Great for React
  - Simple mocking of components, libraries, etc.
- Enzyme
  - Library developed by Airbnb for testing React components
  - jQuery-esque API
  - Recommended by Jest for component testing

---

## Setup, Part 1

- Install the following node packages as dev-dependencies
  - Required: `jest`, `enzyme`, `redux-mock-store`
  - Required for versions of React < 15.5: `react-addons-test-utils`
  - Recommended: globally install `jest-cli`
- Add to your `package.json`:
  - `"scripts": { "test": "jest" }`
  - Tell jest to resolve file extensions
- To transpile our code, need to add a `.babelrc` file with:
  - `{ "presets": ["es2015","react"] }`

---

## Setup, Part 2

- Tests are typically stored inside `__tests__` folders inside every folder that has files to be tested
- Append all test file names with `-test.js`

```
frontend/
  reducers/
    root_reducer.js
    benches_reducer.js
    __tests__/
      root_reducer-test.js
      benches_reducer-test.js
```

<br>

Try running `jest` at the command line - you should see all tests passing!

---

## Jest Basics

- Very similar to RSpec (kinda)
  - `expect`, `describe`, `test`/`it`, and `beforeEach`
- All tests are nested inside callbacks
- Lots of [assertions!](https://facebook.github.io/jest/docs/en/expect.html#content)
  - commonly use `expect()`, `.toEqual()`
- Shared variables need to be declared outside `beforeEach`

```
  test('favorite food is burrito', () => {
    expect(favoriteFood).toEqual('Burrito');
  });
```

---

## Testing a Reducer, Part 1

- What to test?
  - Each `case` statement
  - Default behavior

- **Assignment:** write one test to see if the initial state is an empty object

```js
  test('should initialize with an empty object as the default state', () => {
    /* your code here */
  });
```

---

```js
  test('should initialize with an empty object as the default state', () => {
    expect(BenchesReducer(undefined, {})).toEqual({});
  });
```

---

## Testing a Reducer, Part 2

- Let's test that the `RECEIVE_BENCHES` action causes the correct behavior
- We must declare any shared variables outside our `beforeEach` function

```js
describe('handling the RECEIVE_BENCHES action', () => {
    let action,
        testBenches;

    beforeEach(() => {
      /* assign values to `testBenches` and `action` here */
    });

    test('should replace the state with the action\'s benches', () => {
      /* your code here */
    });

    test('should not modify the old state', () => {
      /* your code here */
    });
  });
```

---

```js

const bench1 = { id: 1, description: "best!", lat: 1.2, lng: 3.4 };
const bench1 = { id: 2, description: "great!", lat: 5.6, lng: 7.8 };

describe('handling the RECEIVE_BENCHES action', () => {
    let action,
        testBenches;

    beforeEach(() => {
      testBenches = { [bench1.id]: bench1, [bench2.id]: bench2 };
      action = { type: 'RECEIVE_BENCHES', benches: testBenches };
    });

    test('should replace the state with the action\'s benches', () => {
      const state = BenchesReducer(undefined, action);
      expect(state).toEqual(testBenches);
    });

    test('should not modify the old state', () => {
      let oldState = { 1: 'oldState' };
      BenchesReducer(oldState, action);
      expect(oldState).toEqual({ 1: 'oldState' });
    });
  });
```
---

## Component Testing

- More difficult, not similar to rspec :(
  - [`Enzyme`](http://airbnb.io/enzyme/docs/api/) to the rescue!
- What to test:
  - Presentational & container components
  - Presence of other components, links, input fields, props
  - Interaction with site (clicking, typing, etc)
- Dependencies to be mocked
  - Action creators, other components
  - Create test instances of reducer, store, default state
- Shallow vs. Full DOM rendering

---

## Types of Rendering

- Shallow
  - Only renders first children
  - Doesn't assert on behavior of child components
  - Great for container-less components
  - `Enzyme.shallow()`
- Full DOM Rendering
  - Component goes through full lifecycle
  - Good for components that do not have custom React component children, otherwise must mock children
  - Allows rendering of container components
  - `Enzyme.mount()`
- Once we render, we can query the page
  - `.find(selector)`, `.props()`, `forEach()`

---

## Redux Docs

Let's look through at an example.

http://redux.js.org/docs/recipes/WritingTests.html#components

---

## Testing 'ReviewForm', Setup Part 1

- We need to import all required files and setup a test store

```js
import React from 'react';
import thunk from 'redux-thunk';
import configureMockStore from 'redux-mock-store';
import { mount } from 'enzyme';
import ReviewFormContainer from '../review_form_container';

const bench = { id: 1, description: "great!", lat: 1.2, lng: 3.4 };
const middlewares = [ thunk ];
const mockStore = configureMockStore(middlewares);
const testStore = mockStore({ benches: { [bench.id]: bench } });
```

---

## Testing 'ReviewForm', Setup Part 2

- Now, let's setup our tests!

```js
describe('review form container', () => {
  let reviewFormWrapper,
      reviewRating,
      reviewBody;

  describe('creating a new review', () => {
    beforeEach(() => {
      reviewFormWrapper = mount(
        <ReviewFormContainer store={testStore} />
      ).find('ReviewForm');

      reviewRating = reviewFormWrapper.find('input').filterWhere(input => (
        input.props().type === 'number'
      ));
      reviewBody = reviewFormWrapper.find('textarea');
    });
  });
});
```

---

## Testing 'ReviewForm'

- Write tests for the default values of the form

```js
    test('correctly maps dispatch to props', () => {
      /* your code here */
    });

    test('pre-fills rating field to 5', () => {
      /* your code here */
    });

    test('pre-fills comment field with empty string', () => {
      /* your code here */
    });

    test('updates the rating field when it changes', () => {
      /* your code here */
    });

```

<br>

Try running `jest` at the command line - you should see four tests passing!

---

```js
  test('correctly maps dispatch to props', () => {
    expect(reviewFormWrapper.props().createReview).toBeDefined();
  });
  
  test('pre-fills rating field to 5', () => {
    expect(reviewRating.props().value).toEqual(5);
  });

  test('pre-fills comment field with empty string', () => {
    expect(reviewBody.props().value).toEqual('');
  });
  
  test('updates the rating field when it changes', () => {
    reviewRating.simulate('change', { target: { value: 2 }});
    expect(reviewRating.props().value).toEqual(2);
  });
```

---

## Mocking Functions (Briefly)

[A06 Example][a06]

[a06]: https://github.com/appacademy/a06-prep/blob/8a42480c9d6fcff13d51d29f0d03d5d0360986ff/solution/frontend/__tests__/post_form-test.js#L62

---

## Tricks of the trade

- `f` to focus on just one test/block
  - Only works with 'it' keyword though! (ie. "fit ('renders the div'...)")
- `x` to ignore a test/block
- `jest path/to/file-test.js` to run just one file
- For testing RRv4, use `react-mock-router` (*written by TA Robert!*)

---

## Where to go from here

- Write tests for your own FSP
  - Testing is not easy!
  - Do not copy exact tests from a06 - do what makes sense for your app
- Write tests for every project and coding challenge you do from now on
- Additional Helpful Resources
  - [A06, which goes through a full Redux cycle](https://github.com/appacademy/a06-prep/tree/master/solution/frontend/__tests__)
  - [Jest/Enzyme]( https://www.codementor.io/vijayst/unit-testing-react-components-jest-or-enzyme-du1087lh8)
  - [React/Redux using Jest (snapshot testing!)](http://academy.plot.ly/react/6-testing/)
