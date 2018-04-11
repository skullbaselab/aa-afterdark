import * as APIUtil from '../util/api_util';

export const RECEIVE_USERS = 'RECEIVE_USERS';
export const RECEIVE_SINGLE_USER = 'RECEIVE_SINGLE_USER';

export const requestAllUsers = () => (dispatch) => {
  return APIUtil.fetchAllUsers()
    .then(users => {dispatch(receiveUsers(users))});
}

export const requestSingleUser = (userId) => (dispatch) => {
  return APIUtil.fetchSingleUser(userId)
    .then(user => dispatch(receiveSingleUser(user)))
}

export const receiveUsers = users => ({
  type: RECEIVE_USERS,
  users
});

export const receiveSingleUser = payload => ({
  type: RECEIVE_SINGLE_USER,
  payload,
});
