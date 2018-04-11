import ReactDOM from 'react-dom';
import React from 'react';
import { Provider } from 'react-redux';
import configureStore from './store/store';
import App from './components/app';
import TweetIndex from './components/tweet_index';
import { HashRouter } from 'react-router-dom';

const Root = ({ store }) => {
  return (
    <div>
      <Provider store={ store }>
        <HashRouter>
          <App />
        </HashRouter>
      </Provider>
    </div>
  );
};

document.addEventListener('DOMContentLoaded', () => {
  let store;
  if (window.currentUser) {
    const preloadedState = {
      session: {
        currentUser: window.currentUser
      }
    };
    store = configureStore(preloadedState);
  } else {
    store = configureStore();
  }
  const root = document.getElementById('root');
  // window.dispatch = store.dispatch;
  ReactDOM.render(<Root store={ store } />, root);
});









"hey";
