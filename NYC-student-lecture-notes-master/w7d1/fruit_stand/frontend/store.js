import { createStore } from 'redux';
import fruitReducer from './fruitReducer.js';

// if we're using our rootReducer we could do
// import rootReducer from './rootReducer';

const Store = createStore(fruitReducer);

export default Store;
