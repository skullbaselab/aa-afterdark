import { ADD_COOKIE } from '../actions/cookie_actions';

const cookiesReducer = (state = [], action) => {
  Object.freeze(state);
  // debugger
  switch (action.type) {
    case ADD_COOKIE:
      return [...state, action.cookie];
    default:
      return state;
  }
};

export default cookiesReducer;
