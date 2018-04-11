import * as APIUtil from '../util/user_api_util';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';

export const login = user => {
  return {
    type: RECEIVE_CURRENT_USER,
    user
  };
};

export const logout = () => {
  return {
    type: LOGOUT_CURRENT_USER
  };
};

export const loginUser = user => dispatch => {
  return APIUtil.login(user).then(u => dispatch(login(u)));
};

export const logoutUser = () => dispatch => {
  return APIUtil.logout().then(() => dispatch(logout()));
};

export const createUser = user => dispatch => {
  return APIUtil.signup(user).then(u => dispatch(login(u)));
};
