import React from 'react';
import { Provider } from 'react-redux';
import TeaListContainer from './tea_list_container';

const Root = ({ store }) => (
  <Provider store={store}>
    <div>
      <TeaListContainer />
    </div>
  </Provider>
);

export default Root;