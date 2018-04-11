## 8/24/2016
## Lecturer: Ryan Hall

# solutions
+ how to set up `MSP` and `MDP`? when do we use container components?
  + where in the `MSP` and `MDP` functions is the actual store?
  + does the presentational component have access to the store? can we just use the store inside the presentational component?
+ are these words like `state`, `connect`, &c., special words or are they just words?
+ what happens when we export `connect(MSP, MDP)(PresComp)`?
  + can we see it drawn out?
+ is using `connect` similar to how we pass down props in react?
+ so you could just be passing the store down as a prop instead of using react-redux?
  + what about for a project with a small scale? is `connect` worth it?
+ if there are other presentational or container components under a presentational components, do they automatically get the `connect`-sent props?
+ in the connect function, what are you doing with the presentational component?
+ in `MDP` are we supposed to be invoking `requestCat()`?
+ i keep hearing that if we just interact directly with the store in our presentational components that it'll get messy - why and how?

# quiz
+ q4: does success get invoked at some point? where?

# middleware
+ ?? are middlewares like reducers?
+ drawing of middlewares maybe not 100% accurate to visualize actions hitting reducers?
+ does middleware ??? (couldn't hear question)? what information do middlewares have access to?
+ if a middleware calls `dispatch`, does it go straight to the store or just to the next middleware?
  + ?? (couldn't hear question)
+ when would the loop break?

# demo
+ why don't you have to pass the store to `Root` in your example?
+ when we write classes, we write `extends React.Component` - why do we need to `import React` when we're writing a functional component?
+ ?? (couldn't hear question) something about importing something?
+ how does the app know to dispatch?
+ ?? (couldn't hear question)
+ what's with the arguments you pass to `createStore`? i thought the second argument was `preloadedState`?
+ is babel messing with the debugger? if you have multiple things called `store` it seems you might run into errors?
+ ?? (couldn't hear question) potentially a recap question?
+ if you're not going to show a loading screen, do you have to call `next` in your middleware?
+ if you wanted to cancel an action, is that when you would not call `next`?
+ interpolating cat elements - can react handle arrays of information?
