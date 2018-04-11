import { ADD_FRUIT, CLEAR } from "./actions";

const _defaultState = [];

const fruitReducer = (oldState = _defaultState, action) => {
  switch(action.type) {
    case ADD_FRUIT:
      return [
          ...oldState,
          action.fruit
        ];
    case CLEAR:
      return _defaultState;
    default:
      return oldState;
  }
}

export default fruitReducer;
