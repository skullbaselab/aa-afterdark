import { ADD_FRUIT, CLEAR } from "./actions";

const _defaultState = {
  fruits: []
};
// set up a default state to avoid working with undefined

const reducer = (oldState = _defaultState, action) => {
  switch(action.type) {
    case ADD_FRUIT:
      return {
        fruits: [
          ...oldState.fruits,
          action.fruit
        ]
      };
    case CLEAR:
      return _defaultState;
    default:
      return oldState;
      // always have a default return to avoid returning undefined, return the current state
  }
};

export default reducer;
