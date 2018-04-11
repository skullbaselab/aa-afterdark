export const ADD_COOKIE = 'ADD_COOKIE';

export const addCookie = (cookie) => {
  // debugger
  return {
    type: ADD_COOKIE,
    cookie
  };
};
