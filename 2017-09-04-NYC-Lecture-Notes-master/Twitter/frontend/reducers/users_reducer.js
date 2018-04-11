import { RECEIVE_USER } from '../actions/user_actions';

const initialState = {};

export default (state = initialState, action) => {
  switch (action.type) {
    case RECEIVE_USER:
    // payload consists of user and tweets
    const user = action.payload.user;
      return Object.assign({}, state, { [user.id]: user });
    default:
      return state;
  }
};
