import { receiveCurrentUser, receiveErrors } from '../actions/session_actions';

export const signup = (user) => {
  return $.ajax({
    method: 'POST',
    url: '/api/users',
    data: { user }
  });
};
