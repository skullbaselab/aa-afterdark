import { RECEIVE_CURRENT_USER, RECEIVE_ERRORS } from '../actions/session_actions';

const initialState = {
  currentUser: null,
  errors: {}
};

export default function sessionReducer(state = initialState, action) {
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      return Object.assign({}, initialState, { currentUser: action.currentUser });
      // this wipes the errors
    case RECEIVE_ERRORS:
      return Object.assign({}, initialState, { errors: action.errors });
    default:
      return state;
  }
}
