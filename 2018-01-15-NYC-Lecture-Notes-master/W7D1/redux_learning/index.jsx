import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import store from './store.js';
import { makeBurger } from './burger_actions';
import BurgerList from './burger_list';
import BurgerForm from './burger_form';

window.makeBurger = makeBurger;
window.store = store;

function App() {
  return (
    <div>
      <BurgerList />
      <BurgerForm />
    </div>
  );
}
// Provider provides the store to connect for all the components that Provider wraps up
function Root({ store }) {
  return (
    <Provider store={ store }>
      <App />
    </Provider>
  );
  // return (
  //   <div>
  //     { person.name }
  //   </div>
  // );
}


document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  // components wont notice store updates and won't re-render unless connected via connect/provider
  // const maurice = { name: 'Maurice' };
  // ReactDOM.render(<Root person={ maurice }/>, root);
  // line 41 wouldnt trigger a re-render
  // maurice.name = "skeemy";
  ReactDOM.render(<Root store={ store }/>, root);
});
// window.store = createStore(combineReducers({ burgers: burgersReducer, salad: saladReducer }));




























// function combineReducers(options) {
//   return function (state, action) {
//     const newState = {};
//     Object.keys(options).forEach(slice => {
//       const newSlice = options[slice](state[slice], action);
//       newState[slice] = newSlice;
//     });
//     return newState;
//   };
// }
