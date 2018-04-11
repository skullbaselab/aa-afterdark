import * as APIUtil from '../util/api_util';

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const RECEIVE_ERRORS = "RECEIVE_ERRORS";

export function receiveCurrentUser(currentUser) {
  return { type: RECEIVE_CURRENT_USER, currentUser };
}

export function receiveErrors(errors) {
  return { type: RECEIVE_ERRORS, errors };
}

export function signIn(user) {
  return (dispatch) => {
    return APIUtil.signIn(user)
      .then(user => dispatch(receiveCurrentUser(user)),
            err => dispatch(receiveErrors(err.responseJSON)));
  };
}

export function signUp(user) {
  return (dispatch) => {
    return APIUtil.signUp(user)
      .then(user => dispatch(receiveCurrentUser(user)),
            err => dispatch(receiveErrors(err.responseJSON)));
  };
}

export function signOut() {
  return (dispatch) => {
    return APIUtil.signOut()
      .then(() => dispatch(receiveCurrentUser(null)));
  };
}
