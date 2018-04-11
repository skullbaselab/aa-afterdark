import { combineReducers } from 'redux';
import postReducer from './postReducer';
import commentReducer from './commentReducer';

export default combineReducers({
  posts: postReducer,
  comments: commentReducer
});
// actions will hit reducers in the order you introduce them to combineReducers here
// you can test this with a debugger :)
