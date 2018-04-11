import * as TodoAPIUtil from '../util/todo_api_util';
import { receiveErrors, clearErrors } from './error_actions';

export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";
export const TODO_ERROR = "TODO_ERROR";


// sync actions
export const receiveTodos = todos => ({
  type: RECEIVE_TODOS,
  todos
});

export const receiveTodo = todo => {
  debugger
  return {

    type: RECEIVE_TODO,
    todo
  };
};

export const removeTodo = todo => ({
  type: REMOVE_TODO,
  todo
});

export const todoError = error => ({
  type: TODO_ERROR,
  error
});



// async actions
export const fetchTodos = () => dispatch => (
  TodoAPIUtil.fetchTodos().then(todos => dispatch(receiveTodos(todos)))
);

export const fetchTodo = id => dispatch => (
  TodoAPIUtil.fetchTodo(id).then(todo => dispatch(receiveTodo(todo)))
);

export const createTodo = todoFromComponent => dispatch => {
  debugger
  const promise = TodoAPIUtil.createTodo(todoFromComponent)
  .then(todoFromDatabase => {
    debugger;
    dispatch(receiveTodo(todoFromDatabase));
    dispatch(clearErrors());
  },
  err => dispatch(receiveErrors(err.responseJSON)));
  console.log("hey what's up you'll see me before response from server");
  return promise;
};

export const updateTodo = todo => dispatch => (
  TodoAPIUtil.updateTodo(todo).then(todo => dispatch(receiveTodo(todo)))
);

export const deleteTodo = todo => dispatch => (
  TodoAPIUtil.destroyTodo(todo).then(todo => dispatch(removeTodo(todo)))
);
