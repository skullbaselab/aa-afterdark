import { merge } from 'lodash';
import { MAKE_BURGER } from './burger_actions';

// burger schema
// { id, bunType, meatType, cheeseType, condiments }
const burgersReducer = function(oldState = { 1: { id: 1, bunType: 'krabby' } }, action) {
  // prevent modification of oldState in current method; nice but not necessary
  Object.freeze(oldState);
  switch(action.type) {
    case MAKE_BURGER:
      debugger
      return merge({}, oldState, { [action.burger.id]: action.burger });
      // won't trigger a re-render
      // return merge(oldState, { [action.burger.id]: action.burger });
    default:
      return oldState;
  }
};

export default burgersReducer;
