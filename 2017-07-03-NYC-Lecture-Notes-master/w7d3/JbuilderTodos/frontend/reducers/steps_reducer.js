import {
  RECEIVE_STEPS,
  RECEIVE_STEP,
  REMOVE_STEP
} from '../actions/step_actions';

import { RECEIVE_TODO } from '../actions/todo_actions'
import merge from 'lodash/merge';

const stepsReducer = (state = {}, action) => {
  let nextState;
  Object.freeze(state);

  switch(action.type) {
    // also listening to the receive todo action inside of my step reducer
    case RECEIVE_TODO:
      nextState = merge({}, state);
      action.payload.steps.forEach((step) => nextState[step.id] = step);
      return nextState;
    case RECEIVE_STEP:
      return merge({}, state, { [action.step.id]: action.step });
    case REMOVE_STEP:
      nextState = merge({}, state);
      delete nextState[action.step.id]
      return nextState

    default:
      return state;
  }
};

export default stepsReducer;

// Sample State Shape
// {
//   1: {
//     title: "walk to store",
//     done: false
//   },
//   2: {
//     title: "buy soap",
//     done: false
//   },
//   3: {
//     title: "walk to park",
//     done: false
//   },
//   4: {
//     title: "play with dog",
//     done: false
//   }
// };
