import { combineReducers } from 'redux';
// renamed fruitReducer as fruits
import fruitReducer from './fruitReducer';
import hotDogReducer from './hotDogReducer';

const rootReducer = combineReducers({
  fruits: fruitReducer,
  hotDogs: hotDogReducer
});

export default rootReducer;
