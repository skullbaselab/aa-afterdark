## Lecture

**1) Why Redux**
+ Manage state in large scale application
  + Facebook messages: need message to pop up in corner, need notification in header. These are completely separate parts of the page!
  + Redux lets all components listen to a single store, single state tree. Single source of truth.

**2) Redux vs ReactRedux**
+ Redux API: store = createStore(reducer)
  + getState -- reads entire state tree from store
  + dispatch -- dispatch(action) invokes reducer(state, action)
    + action is a POJO
    + reducer is a pure function that takes an old state and an action (a message) and returns a NEW state.
  + subscribe -- subscribe(listener)
    + listener is a function
    + All listeners get invoked after reducer gets invoked
  + You never call reducer yourself. Redux does it for you.
  + dispatch is the only way to change state of store.

+ ReactRedux
  + Components
    + Presentational components get everything from props: some slice of the store and some callbacks.
    + Container components read state from the store, subscribe to the store, and dispatch actions to the store. They pass down state and dispatching callbacks as props to presentational components.
      + Instead of `connect`, we could build container components with:
        + `import store from '../store';`
        + `store.subscribe(function () {
            rerender if store.getState().myPart is new
          })` in componentDidMount
        + `store.dispatch` in instance methods.
      + `connect` sets this up for us.
        + We wrap app in a `Provider` component so that `connect` can access the store.

      class Provider extends React.Component {
        getChildContext() {
          return {
            store: this.props.store;
          };
        }
        render() {
          return this.props.children;
        }
      }

      Provider.childContextTypes = {
        store:: React.PropTypes.object
      };

  + Data flow (maybe draw on whiteboard)
    + Presentational component event is triggered
    + Container component's dispatching callback is invoked
    + reducer(state, action) _MUST RETURN NEW OBJECT_
    + Container component rerenders if its slice of state is a new object.
    + Presentation component rerenders with new props.

**3) controlledComponents**
+ Form: example of presentational component that DOES keep track of internal state
+ Keeping state in component makes lets us track user input within the Virtual DOM. We won't need to look at the real DOM `onSubmit`
+ Use `e.preventDefault` for `handleSubmit` but not for `handleInput`. Only need to prevent default behaviour that would result in an HTTP request.

**4) Reducers**
+ pitfall of mutation: components will not rerender unless their slice of state is a new object
+ multiple reducers necessary for managing state in large apps
+ Without using `combineReducers`
  ```js
  function rootReducer(state, action) {
    return {
      fruits: fruitsReducer(state.fruits, action),
      farmers: farmersReducer(state.farmers, action)
    }
  }
  ```
+ `combineReducers` is just shortcut syntax. COMPLETELY OPTIONAL.

```
