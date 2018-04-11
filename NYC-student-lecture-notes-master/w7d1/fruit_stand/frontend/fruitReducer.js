import { ADD_FRUIT, CLEAR } from "./actions";

const _defaultState = {
  fruits: []
}

const fruitReducer = (oldState = _defaultState, action) => {
  debugger
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
  }
}

export default fruitReducer;
