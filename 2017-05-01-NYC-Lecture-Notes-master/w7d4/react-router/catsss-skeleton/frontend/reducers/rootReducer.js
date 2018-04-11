import { combineReducers } from 'redux';

import cats from './catReducer';
window.cats;

export default combineReducers({
  cats,
});
