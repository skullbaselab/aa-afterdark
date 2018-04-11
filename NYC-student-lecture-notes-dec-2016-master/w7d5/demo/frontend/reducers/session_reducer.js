import { RECEIVE_CURRENT_USER, RECEIVE_ERRORS } from '../actions/session_actions';

const initialState = {
  currentUser: null,
  errors: {}
};

export default function sessionReducer(state = initialState, action) {
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      return Object.assign({}, state, { currentUser: action.currentUser });
    case RECEIVE_ERRORS:
      return Object.assign({}, state, { errors: action.errors });
    default:
      return state;
  }
}
