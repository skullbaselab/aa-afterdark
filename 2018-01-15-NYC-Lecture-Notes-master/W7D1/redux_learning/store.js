import { createStore, combineReducers } from 'redux';
import burgersReducer from './burgers_reducer';
import saladReducer from './salad_reducer';

export default createStore(combineReducers({ burgers: burgersReducer, salad: saladReducer }));
