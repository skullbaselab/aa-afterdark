import React from "react";
import { Provider } from "react-redux";
import App from "./app";
import { HashRouter } from "react-router-dom";


const Root = ({ store }) => {
  // Alterntaives to deconsructing your argument above by passing in 'props' instead:
  // const store = props.store;
  // const { store } = props;
  return (
    <HashRouter>
      <Provider store={ store }>
        <App />
      </Provider>
    </HashRouter>
  );
};

export default Root;
