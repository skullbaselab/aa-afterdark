import { ADD_BURGER } from '../actions/burgerActions';
import { CLEAR_ALL } from '../actions/fruitActions';

const burgerReducer = (state = [], action) => {
  // debugger;
  switch(action.type) {
    case ADD_BURGER:
    debugger
      return state.concat(action.burger);
    case CLEAR_ALL:
    debugger
      return [];
    default:
      return state;
      // state is the same object
  }
};

export default burgerReducer;
