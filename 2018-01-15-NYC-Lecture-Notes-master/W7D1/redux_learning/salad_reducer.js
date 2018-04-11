import { merge } from 'lodash';
import { MAKE_SALAD } from './salad_actions';

const saladReducer = function(oldState = {}, action) {
  // prevent modification of oldState in current method; nice but not necessary
  Object.freeze(oldState);
  // debugger
  switch(action.type) {
    case MAKE_SALAD:
      return merge({}, oldState, { [action.salad.id]: action.salad });
    default:
    // debugger
      return oldState;
  }
};

export default saladReducer;
