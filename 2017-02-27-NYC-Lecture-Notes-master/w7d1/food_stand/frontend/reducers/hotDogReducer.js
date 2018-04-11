import { ADD_HOTDOG } from '../actions/hotDogActions';
import { CLEAR_FOOD } from '../actions/fruitActions';

// Do not mutate state! Return a brand new object as state

const _defaultState = [];

const hotDogReducer = (oldState = _defaultState, action) => {
  Object.freeze(oldState); // prevent mutation of oldState

  switch(action.type) {
    case ADD_HOTDOG:

      return oldState.concat(['hotdog']);
    case CLEAR_FOOD:
      return [];
    default:
      return oldState;
  }
};

export default hotDogReducer;
