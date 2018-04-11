import { combineReducers } from 'redux';
import veggieReducer from './veggie_reducer';
import fruitReducer from './fruit_reducer';

// our redux state will now have keys of veggie and fruit pointing to whatever their respective reducers return
// every action dispatched will hit every reducer
const reducer = combineReducers({
  veggie: veggieReducer,
  fruit: fruitReducer,
});

export default reducer;
