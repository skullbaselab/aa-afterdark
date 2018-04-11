import { createStore, applyMiddleware } from "redux"
// import thunk from "../middleware/thunk"
import thunk from 'redux-thunk';
import logger from 'redux-logger';
import rootReducer from "../reducers/root";

export default function(preloadedState = {}) {
  return createStore(rootReducer, preloadedState,
    applyMiddleware(thunk, logger));
}

// function thunk(store) {
//   return function (next) {
//     return function (action) {
//       // debugger
//       if (typeof action === 'function') {
//         const dispatch = store.dispatch;
//         console.log("You're a function!");
//         return action(dispatch);
//       } else {
//         console.log("You're a regular object!");
//         return next(action);
//       }
//     };
//   };
// }

// function applyMiddleware(...middlewares) {
//   // debugger
//   return (createStore) => (...args) => {
//     // debugger
//     const store = createStore(...args)
//     let dispatch = store.dispatch
//     let chain = []
//
//     const middlewareAPI = {
//       getState: store.getState,
//       dispatch: (...args) => dispatch(...args)
//     }
//     chain = middlewares.map(middleware => {
//       // debugger
//       return middleware(middlewareAPI)
//     })
//     dispatch = compose(...chain)(store.dispatch)
//
//     return Object.assign({}, store, dispatch)
//     // return {
//     //   dispatch
//     // }
//   }
// }

// function compose(...funcs) {
//   if (funcs.length === 0) {
//     return arg => arg
//   }
//
//   if (funcs.length === 1) {
//     return funcs[0]
//   }
//
//   return funcs.reduce((a, b) => (...args) => a(b(...args)))
// }

// function myMiddleware(store) {
//   console.log("I just received a store", store);
//   return function (nextMiddleware) {
//     console.log("I just received a middleware", nextMiddleware);
//     return function (action) {
//       console.log("I just received an action", action);
//       return nextMiddleware(action);
//     };
//   };
// }

// function myOtherMiddleware(store) {
//   return function (next) {
//     return function (action) {
//       return next(action);
//     };
//   };
// }
