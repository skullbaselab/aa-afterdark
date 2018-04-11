import { combineReducers } from 'redux';

import fruit from './fruitReducer';
import hotDogs from './hotDogReducer';

const rootReducer = combineReducers({
  fruit,
  hotDogs
});

export default rootReducer;
