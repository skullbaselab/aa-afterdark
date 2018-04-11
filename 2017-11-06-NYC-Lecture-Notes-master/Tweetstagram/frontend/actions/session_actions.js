export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
import * as APIUtil from '../util/session_util';

export const receiveCurrentUser = (currentUser) => {
  return {
    type: RECEIVE_CURRENT_USER,
    currentUser,
  };
};

export const signUp = (user) => (dispatch) => {
  return APIUtil.signUp(user).then(
    (currentUser) => dispatch(receiveCurrentUser(currentUser))
  );
};

// window.signUp = signUp;
