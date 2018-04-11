import React from 'react';
import { Provider } from 'react-redux';
import store from '../store/store';
import FruitIndex from './fruit_index';
import App from './app';
// import FruitIndexContainer from './fruit_index_container';
// import BurgerCount from './burger_count';

const Root = () => {
  return (
    <Provider store={store}>
      <App />
    </Provider>
  );
};

export default Root;
