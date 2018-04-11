# Partner A interviews Partner B
## Personal Pitch (1-2 minutes)
Tell me about yourself.

## Knowledge Question (5 minutes)
Explain the differences between call, apply, and bind in JavaScript.

### Solution
* https://codeplanet.io/javascript-apply-vs-call-vs-bind/
* Be sure to spend a little bit of time going to the official docs for each method.
  * [Call][call]
  * [Apply][apply]
  * [Bind][bind]

[call]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/call
[apply]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/apply
[bind]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/bind

## Systems Design and Architecture Question (5 minutes)
Explain the differences between SQL and NoSQL. Explain why you would choose one over the other and provide concrete examples.

### Solution
* https://github.com/donnemartin/system-design-primer#sql-or-nosql
* https://www.sitepoint.com/sql-vs-nosql-differences/

## Refactoring (30 minutes)
Please download the [benchbnb.zip file][benchbnb-zip]. Don't forget to run `npm install`, `bundle install`, `webpack --watch`, and `rake db:setup`.

We have an app that's similar to Airbnb, except it's for benches, called BenchBnb. Right now, the `BenchShow` component is pretty gnarly: It's hard to maintain and hard to read. Your task today is to refactor the `BenchShow` React component.

Feel free to break it apart into smaller components as you see fit. In addition, you can also add new route(s) if you'd like. The React Router can be found in the `root.jsx` file.

Remember to explain your thought process not only when refactoring, but also in the beginning when you're explaining your understanding how `BenchShow` is originally set up.

### Refactoring Solution
There are multiple ways that the interviewee can choose to refactor here. The main curriculum has [one way of cleanly breaking apart the `BenchShow` component][benchbnb-solution].

In their implementation, note the usage of another `Route` for the `ReviewForm` in the React Router.

Again, since there is more than one correct way to do this, the key thing is for the interviewee to consistently explain in a clear way **why** they're choosing to refactor in a specific way.

Some things that the interviewee can talk about include:
* [The usage of stateless functional components.][stateless-components]
  * [Here's another interesting reading about the usage of class syntax in JavaScript][class-js]
* The usage of the React Router.
* The logic behind how deeply components should be nested.

<!-- Links -->
[benchbnb-zip]: ./benchbnb_refactor.zip?raw=true
[benchbnb-solution]: https://github.com/appacademy/curriculum/tree/master/react/projects/bench_bnb/solution/frontend/components/bench_show
[stateless-components]: https://hackernoon.com/react-stateless-functional-components-nine-wins-you-might-have-overlooked-997b0d933dbc
[class-js]: https://medium.com/javascript-scene/10-interview-questions-every-javascript-developer-should-know-6fa6bdf5ad95
