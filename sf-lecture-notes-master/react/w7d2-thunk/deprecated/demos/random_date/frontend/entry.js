import React from 'react';
import ReactDOM from 'react-dom';

import AppContainer from './components/app_container';
import { Provider } from 'react-redux';
import Store from './store/store';


const Root = () => (
  <Provider store={Store} >
    <AppContainer />
  </Provider>
);

document.addEventListener("DOMContentLoaded", function(){
  const container = document.getElementById("app");
  ReactDOM.render(<Root />, container);
});
