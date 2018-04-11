import { combineReducers } from 'redux';
import fruits from './fruitReducer';
import farmers from './farmerReducer';

// here we import our reducers with names to match the slice of state they are
// concerned with, so we can use sleek ES6 object syntax >:)

export default combineReducers({fruits, farmers});

// export default combineReducers({
//   fruits: fruits,
//   farmers: farmers,
// });

// const rootReducer = (state, action) => {
//   return {
//     fruits: fruitReducer(state.fruits, action),
//     farmers: farmerReducer(state.farmers, action),
//   };
// };
