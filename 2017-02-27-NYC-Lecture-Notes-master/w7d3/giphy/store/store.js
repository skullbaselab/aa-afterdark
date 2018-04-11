import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
// get the default from '../reducers/root_reducer' and assign to 'RootReducer'
import RootReducer from '../reducers/root_reducer';

const configureStore = () => {
  return createStore(RootReducer, applyMiddleware(thunk));
};

export default configureStore;
