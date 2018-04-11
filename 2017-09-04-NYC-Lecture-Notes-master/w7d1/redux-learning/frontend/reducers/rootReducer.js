// import { ADD_FRUIT, CLEAR_FRUIT } from '../actions/fruit_actions';
import { combineReducers } from 'redux';

import fruits from './fruitReducer';
import burgers from './burgerReducer';

const rootReducer = combineReducers({
  fruits,
  burgers,
});

export default rootReducer;
