import { createStore, combineReducers, applyMiddleware } from 'redux';
import DateReducer from '../reducers/date_reducer';
import DateMiddleware from '../middleware/date_middleware';

const MasterReducer = combineReducers({
  dates: DateReducer
});

const MasterMiddleware = applyMiddleware(DateMiddleware);

const Store = window.Store = createStore(
  MasterReducer,
  MasterMiddleware
);

export default Store;
