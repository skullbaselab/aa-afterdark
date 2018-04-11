import { ADD_FRUIT, CLEAR_FOOD } from '../actions/fruitActions';

// Do not mutate state! Return a brand new object as state

const _defaultState = [];

const fruitReducer = (oldState = _defaultState, action) => {
  Object.freeze(oldState); // prevent mutation of oldState
  //
  switch(action.type) {
    case ADD_FRUIT:
      // return brand new array with all the old fruit plus the new one
      return oldState.concat([action.fruit]);
    case CLEAR_FOOD:
      return [];
    default:
      return oldState;
  }
};

export default fruitReducer;
