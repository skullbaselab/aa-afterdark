import { combineReducers } from 'redux';

import fruits from './fruitReducer';
import burgers from './burgerReducer';

const rootReducer = combineReducers({
  fruits,
  burgers,
});

// function combineReducers(options) {
//   return function (state, action) {
//     const newState = {};
//     Object.keys(options).forEach(slice => {
//       const newSlice = options[slice](state[slice], action);
//       newState[slice] = newSlice;
//     });
//     return newState;
//   };
// }
// export default function(state = {}, action) {
//   // debugger
//   switch (action.type) {
//     case "important":
//       return { weDidIt: true };
//       // must return a new object; don't modify existing state
//     default:
//       return state;
//   }
// }

export default rootReducer;
