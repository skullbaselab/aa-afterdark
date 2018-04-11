import React from 'react';
import { Provider } from 'react-redux';
import TeaListContainer from './tea_list_container';
import CookieListContainer from './cookie_list_container';

const Root = ({ store }) => (
  <Provider store={store}>
      <TeaListContainer />
      <CookieListContainer />
  </Provider>
);

export default Root;
