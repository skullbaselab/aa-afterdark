import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';

import store from './store';
import { addOrange, addApple, clearFruit } from './actions';
import FruitStandContainer from './components/fruit_stand_container';

window.store = store;

const App = () => (
  <Provider store={store}>
    <FruitStandContainer />
    // anything between the Provider tags can be connected to the store
    // <HotdogStandContainer />
  </Provider>
);

document.addEventListener("DOMContentLoaded", () => {
  ReactDOM.render(<App />, document.getElementById('root'));
});
