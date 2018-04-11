import { ADD_BURGER } from '../actions/burger_actions';

const burgerReducer = (state = 0, action) => {
  switch (action.type) {
    case ADD_BURGER: {
      return state + 1;
    }
    default:
      return state;
  }
};

export default burgerReducer;
