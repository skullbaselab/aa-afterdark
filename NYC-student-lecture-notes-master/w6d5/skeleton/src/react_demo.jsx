import React from 'react';
import ReactDOM from 'react-dom';
import App from './app';

const root = document.getElementById('content');

// ReactDOM.render(React.createElement("h1", { className: "header" }, "hello worlds!"), root);

// ReactDOM.render(<h1 className="header">hello worlds!</h1>, root);

ReactDOM.render(<App />, root);
