/*
API UTILS
*/
export const fetchTodos = () => (
  $.ajax({
    method: 'GET',
    url: '/api/todos'
  })
);

/*
ACTIONS
*/
import * as TodoAPIUtil from '../util/todo_api_util';
export const RECEIVE_TODOS = "RECEIVE_TODOS";
// sync - action creator
export const receiveTodos = todos => ({
  type: RECEIVE_TODOS,
  todos
});
// async - thunk action creator
export const requestTodos = () => dispatch => (
  TodoAPIUtil.fetchTodos().then(todos => dispatch(receiveTodos(todos)))
);


// in container mapDispatchToProps:
// receiveTodos: () => dispatch(receiveTodos())

/* receiveTodos() returns:
  {
    type: RECEIVE_TODOS,
    todos
  }
*/


// in container mapDispatchToProps:
// requestTodos: () => dispatch(requestTodos())

/* requestTodos() returns:
  dispatch => (
    TodoAPIUtil.fetchTodos().then(todos => dispatch(receiveTodos(todos)))
  );
*/

/*
THUNK MIDDLEWARE
*/
const thunkMiddleware = ({ dispatch, getState }) => next => action => {
  if (typeof action === 'function') {
    return action(dispatch, getState);
  }
  return next(action);
};

export default thunkMiddleware;
